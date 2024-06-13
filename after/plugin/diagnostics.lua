local ERROR = vim.diagnostic.severity.ERROR
local WARN = vim.diagnostic.severity.WARN
local INFO = vim.diagnostic.severity.INFO
local HINT = vim.diagnostic.severity.HINT

vim.diagnostic.config {
  float = {
    source = true,
  },
  severity_sort = true,
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
