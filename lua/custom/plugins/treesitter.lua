vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
}
vim.pack.add { 'https://github.com/kiyoon/repeatable-move.nvim' } -- depends on textobjects

-- keymaps
vim.keymap.set(
  'n',
  '<leader>a',
  function() require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner' end,
  { desc = 'Swap next inner [a]rgument' }
)
vim.keymap.set(
  'n',
  '<leader>A',
  function() require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.inner' end,
  { desc = 'Swap previous inner [A]rgument' }
)
