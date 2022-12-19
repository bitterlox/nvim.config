#!/bin/bash

# TODO:
# √ check parameters
# √ check pack directory, if not found create
# √ check git repository, if not found init (and init submodules) 
# x handle install command
# √ - check for sub-args (eager or lazy load plugin, repo url)
# √ - invoke a git command to see if repo exists &or is clonable
# √ - create a subdir in pack dir with plugin name
# √ - depending on subarg create opt (lazy) or start(eager) subdir
# x - clone plugin & add to git submodule (with pinned version)
# x   - figure out how to pin the submodule to a commit that is tied to a specific branch
# x - generate documentation
# x - if lazy loaded add a line to load the plugin?
# x   - or maybe i prompt the user to review the order in which the plugins are loaded?
# x   - or maybe i do this manually?
# x handle remove command
# x - check sub args (name of pkg to remove)
# x - check if name of pkg is actually the name of an installed package (can use a fuzzy finder to do "did you mean *** ?")
# x - unlink from git submodule, delete dir?
# x - if was lazy linked, check and remove import lines
# x handle the update command

## USEFUL VARIABLES ##

pack_dir="$(pwd)/pack"

echo $pack_dir

## PRE-COMMAND CHECKS ##

# check parameters

die () {
    echo >&2 "$@"
    exit 1
}

# check we've got some arguments passed in

if [[ ! "$#" -gt 0 ]]
then
     die "no arguments provided"
fi

# check pack directory, if not found create

if [[ ! -d $pack_dir ]]
then
     echo "creating ./pack directory"
     mkdir $pack_dir
fi

# check git is installed

git --version > /dev/null 2>&1 # discard output
GIT_IS_INSTALLED=$?

[[ GIT_IS_INSTALLED ]] || die "git is not installed on this system"

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

    # figure out which tag we want to pin

    latest_tag_msg=$(git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' $repo_url | tail --lines=1)

    latest_tagged_version=$(echo ${latest_tag_msg} | cut -d / -f 3 | sed -e "s/\^{}$//")
    latest_tag_commit=$(echo ${latest_tag_msg} | cut -d ' ' -f 1)

       if [[ $latest_tagged_version -eq "" && $latest_tag_commit -eq "" ]]
    then
        echo "no tags found, pinning to HEAD"
    else
        echo $latest_tagged_version
        echo $latest_tag_commit
    fi

    # create plugin directory

    package_name=$(echo $repo_url | xargs basename -s .git)
    plugin_root=""

    if [[ $install_dir -eq "eager" ]]
    then
        plugin_root="${pack_dir}/${package_name}/start" 
    else
        plugin_root="${pack_dir}/${package_name}/opt"
    fi

    mkdir -p $plugin_root

    
}

## UNINSTALL COMMAND ##
uninstall() {
    echo "uninstall called with $@" 
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


