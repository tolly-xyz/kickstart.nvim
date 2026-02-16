local remap = vim.keymap.set

remap('n', '<leader>rt', function()
  local cursor_row = vim.fn.line '.' - 1
  local query = vim.treesitter.query.parse(
    'rust',
    [[
(
    (attribute_item (
        attribute ((identifier) @mod_attr)
        arguments: (token_tree(identifier)+ @arg)
    ))
    (#eq? @mod_attr "cfg")
    (#any-eq? @arg "test")
    .
    (attribute_item)*
    .
    (mod_item body: (declaration_list 
        (attribute_item ((attribute) @attr))
        (#match? @attr "test")
        .
        (attribute_item)*
        .
        (function_item) @test_fn
    ))
)
    ]]
  )

  local tree = vim.treesitter.get_parser():parse()[1]
  local test_name = nil
  for id, node, _, _ in query:iter_captures(tree:root(), 0) do
    if query.captures[id] ~= 'test_fn' then
      goto continue
    end

    local start_row, _, end_row, _ = node:range()
    if cursor_row <= end_row and cursor_row >= start_row then
      local name_node = node:field('name')[1]
      test_name = vim.treesitter.get_node_text(name_node, 0)
      break
    end
    ::continue::
  end
  if test_name == nil then
    return
  end
  vim.print(test_name)
  local out = vim.system({ 'cargo', 'pkgid' }, { cwd = vim.fn.expand '%:h', text = true }):wait()
  if out.stdout == nil then
    return
  end
  local package = vim.fn.shellescape(out.stdout:gsub('%s', ''))
  vim.api.nvim_cmd({ cmd = 'Cargo', args = { 'test', '--package', package, test_name } }, {})
end, {})
