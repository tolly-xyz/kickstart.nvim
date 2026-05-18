local ERROR = vim.diagnostic.severity.ERROR
local WARN = vim.diagnostic.severity.WARN
local INFO = vim.diagnostic.severity.INFO
local HINT = vim.diagnostic.severity.HINT

vim.diagnostic.config {
  float = {
    source = true,
    border = 'single',
  },
  signs = {
    text = {
      [ERROR] = '',
      [WARN] = '',
      [INFO] = '󰋽',
      [HINT] = '',
    },
  },
  virtual_text = false,
}

vim.o.winborder = 'single'
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
