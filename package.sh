#!/bin/bash

# TODO:
# √ check parameters
# √ check pack directory, if not found create
# √ check git repository, if not found init (and init submodules) 
# x handle install command
# √ - check for sub-args (eager or lazy load plugin, repo url)
# x - add optional sub arg that pins a plugin to head even though it's got a tag
# √ - invoke a git command to see if repo exists &or is clonable
# √ - create a subdir in pack dir with plugin name and check if a plugin with the same name is already installed
# √ - depending on subarg create opt (lazy) or start(eager) subdir
# √ - clone plugin & add to git submodule (with pinned version)
# √   - figure out how to pin the submodule to a commit that is tied to a specific branch
# √   - commit newly added plugin
# x - generate documentation
# x - if lazy loaded add a line to load the plugin?
# x   - or maybe i prompt the user to review the order in which the plugins are loaded?
# x   - or maybe i do this manually?
# x handle remove command
# √ - check sub args (name of pkg to remove)
# √ - check if name of pkg is actually the name of an installed package (can use a fuzzy finder to do "did you mean *** ?")
# √ - do git rm to remove repo from tree
# √ - rm -rf to remove files
# √ - remove repo also from .git/modules and git config, see https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule
# x - if was lazy linked, check and remove import lines
# x handle the update command
# x handle a command to do setup when repo is first cloned (fetch all submodules, and other eventual stuff)

## USEFUL VARIABLES ##

repo_root=$(pwd)
pack_dir="pack/plugins"

## HELPER FUNCTIONS ##

die () {
    echo >&2 "$@"
    exit 1
}

check_git_install() {


# check git is installed

git --version > /dev/null 2>&1 # discard output
GIT_IS_INSTALLED=$?

[[ GIT_IS_INSTALLED ]] || die "git is not installed on this system"

# check git version

min_version="2.39.0"

if (echo a version $min_version; git --version) | sort -Vk3 | tail -1 | grep -q git
then
	echo "git version sufficent"
else
	die "git version not recent enough, wanted $min_version, got $(git --version)"
fi


}

commit_plugin_state() {

    message=$1

    git add "${repo_root}/pack" 
    git add "${repo_root}/.gitmodules"

    git commit -m "$message"
    COMMIT_STATUS=$?

    if [[ ! COMMIT_STATUS -eq 0 ]]
    then
        die "couldn't commit changes"
    fi

}

## PRE-COMMAND CHECKS ##

# check parameters

# check we've got some arguments passed in

if [[ ! "$#" -gt 0 ]]
then
     die "no arguments provided"
fi

# check pack directory, if not found create

if [[ ! -d $pack_dir ]]
then
     echo "creating ./pack directory"
     mkdir -p $pack_dir
fi

# check git install

check_git_install

# check ripgrep is installed

rg --version > /dev/null 2>&1 # discard output
RG_IS_INSTALLED=$?

[[ RG_IS_INSTALLED ]] || die "ripgrep is not installed on this system"

# check we are in a git repo, otherwise initalize it
git rev-parse --is-inside-work-tree > /dev/null 2>&1 # discard output
GIT_REPO_PRESENT=$?

if [[ GIT_REPO_PRESENT -ne 0 ]]
then
    echo "git repo not found, initializing"
    git init > /dev/null 2>&1
    git submodule init
fi

## INSTALL COMMAND ##
install() {
    echo "install called with $@" 
    
    install_mode=$2
    repo_url=$3

    # check install mode param
    echo $install_mode | grep -E -q "eager|lazy" || die "install can only be called with 'eager' or 'lazy', instead '$install_mode' was passed"

    # check repo url
    # regex from here with a couple of tweaks: https://stackoverflow.com/questions/2514859/regular-expression-for-git-repository 
    repo_url_regex="((git|ssh|http(s)?)|(git@[\w\.]+))(:(\/\/)?)([\w\.@\:\/\-~]+)(\/)"

    echo $repo_url | grep -E -q $repo_url_regex || die "repo url '$repo_url' does not match regex pattern"

    # check remote repo exists
    GIT_TERMINAL_PROMPT=0 git ls-remote $repo_url HEAD > /dev/null 2>&1
    GIT_REPO_EXISTS=$? 

    if [[ ! GIT_REPO_EXISTS -eq 0 ]]
    then
        die "couldn't find git repo at '$repo_url', it might not exist or be private"
    fi

    # create plugin directory and check if plugin is already installed

    plugin_name=$(echo $repo_url | xargs basename -s .git)
    plugin_root=""

    if [[ $install_dir -eq "eager" ]]
    then
        plugin_root="${pack_dir}/start/${plugin_name}" 
        [[ -d $plugin_root ]] && die "plugin with name $plugin_name is already present at $plugin_root" 
    else
        plugin_root="${pack_dir}/opt/${plugin_name}"
        [[ -d $plugin_root ]] && die "plugin with name $plugin_name is already present at $plugin_root" 
    fi

    git submodule add $repo_url $plugin_root
    SUBMODULE_ADD_SUCCESSFUL=$?

    if [[ ! SUBMODULE_ADD_SUCCESSFUL -eq 0 ]] 
    then
        die "couldn't add cloned repo as submodule"
    fi


    # need more robust way to get tags
    
    latest_tagged_version=$(cd $plugin_root && git describe --abbrev=0 --tags)
    STATUS=$?

    if [[ ! STATUS -eq 0 ]] 
    then
        echo "no tags found, pinning to HEAD"

        cd $repo_root

        commit_plugin_state "installed ${plugin_name} at HEAD"
    else
        cd $plugin_root
	
	git checkout $latest_tagged_version > /dev/null 2>&1
	STATUS=$?

	[[ STATUS -eq 0 ]] || die "couldn't checkout the $latest_tagged_version tag"

        cd $repo_root

        commit_plugin_state "installed ${plugin_name} at version $latest_tagged_version" 
    fi

}

## UNINSTALL COMMAND ##
uninstall() {
    echo "uninstall called with $@"

    plugin_to_remove=$2

    plugin_dir=""

    if [[ -d "${pack_dir}/start/${plugin_to_remove}" ]]
    then 
        plugin_dir="${pack_dir}/start/${plugin_to_remove}"
    elif [[ -d "${pack_dir}/opt/${plugin_to_remove}" ]]
    then 
        plugin_dir="${pack_dir}/opt/${plugin_to_remove}"
    else
        die "no plugin with name ${plugin_to_remove} found in ${pack_dir}"
    fi

    echo "removing plugin ${plugin_to_remove}"

    git rm $plugin_dir
    GIT_RM_STATUS=$?

    [[ GIT_RM_STATUS -eq 0 ]] || die "couldn't git rm plugin directory" 

    rm -rf $plugin_dir
    RM_STATUS=$?

    [[ RM_STATUS -eq 0 ]] || die "couldn't delete plugin directory"

    commit_plugin_state "removed $plugin_to_remove"

    rm -rf ".git/modules/${pack_dir}/${plugin_to_remove}"
    RM_STATUS=$?

    [[ RM_STATUS -eq 0 ]] || die "couldn't git rm .git/modules plugin directory" 


    git config --remove-section "submodule.${plugin_dir}"
    GIT_CONFIG_STATUS=$?

    [[ GIT_CONFIG_STATUS -eq 0 ]] || die "couldn't remove plugin directory from git config" 


    echo "removed $plugin_to_remove"


}

## UPDATE COMMAND ##
update() {
    echo "update called with $@" 
}

## COMMAND SWITCH
case $1 in
    install)
        install $@
        ;;
    uninstall)
        uninstall $@
        ;;
    update)
        update $@
        ;;
    *)
        die "unrecognized command: $1"
        ;;
esac


