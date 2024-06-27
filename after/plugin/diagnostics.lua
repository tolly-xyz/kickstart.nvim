local ERROR = vim.diagnostic.severity.ERROR
local WARN = vim.diagnostic.severity.WARN
local INFO = vim.diagnostic.severity.INFO
local HINT = vim.diagnostic.severity.HINT

vim.diagnostic.config {
  float = {
    source = true,
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

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  -- Use a sharp border with `FloatBorder` highlights
  border = 'single',
})
