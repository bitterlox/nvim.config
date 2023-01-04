return function (cmp)
  return cmp.mapping.preset.insert({
    -- next item
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    -- previous item
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    -- scroll back docs
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- scroll forward docs
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- start completion
    ['<C-Space>'] = cmp.mapping.complete(),
    -- stop completion
    ['<C-e>'] = cmp.mapping.abort(),
    -- accept selected completion suggestion (also enter key works for this)
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  })
end
