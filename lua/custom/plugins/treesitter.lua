vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    version = 'main',
  },
}
vim.pack.add { 'https://github.com/kiyoon/repeatable-move.nvim' } -- depends on textobjects
