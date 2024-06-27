-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/nvim-treesitter-context',
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end,
  },
  'tpope/vim-fugitive',
  -- 'tpope/vim-surround',
  -- 'tpope/vim-repeat',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  'ThePrimeagen/vim-be-good',
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
