local set = vim.o
local TAB_WIDTH = 4

set.background = "dark"
set.mouse = ""

set.number = true
set.relativenumber = true
set.scrolloff = 4

set.expandtab = true
set.smartindent = true
set.autoindent = true
set.smarttab = true

set.tabstop = TAB_WIDTH
set.shiftwidth = TAB_WIDTH
set.softtabstop = TAB_WIDTH

set.incsearch = true

set.wrap = false

-- reference for mapping commands
-- https://stackoverflow.com/q/3776117/17997341

-- inspiration taken from ThePrimeagen
-- https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/after/plugin/keymap/init.lua

local remap = vim.keymap.set

-- jumps and vertical movement
remap("n", "<C-o>", "<C-o>zz")
remap("n", "<C-i>", "<C-i>zz")
remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")
remap("n", "n", "nzz")
remap("n", "N", "Nzz")

-- paste over highlighted text, keep pasted text in register
remap("x", "<leader>p", "\"_dP")

-- delete to blackhole instead of default register
remap("", "<leader>d", "\"_d")

-- yank to system clipboard
-- remap("", "<leader>y", "\"+y")

-- telescope
remap("n", "<leader>saf", function()
  require("telescope.builtin").find_files {
    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }
  }
end, { desc = "[S]earch [A]ll [F]iles" })

vim.cmd([[
  command  Python bot 30 split | terminal python
]])

vim.cmd([[
  command  Terminal bot 30 split | terminal
]])

-- vim.api.nvim_create_user_command("Python", function(opts)
--  args = opts.args or "30"
--  print(opts.args)
--  print(args)
--  return vim.cmd("command -nargs=? Python bot " .. args .. "split | terminal python")
-- end, {nargs="?"})

local run_cmd_map = {
  python = '!python %',
  rust = '!cargo run',
}

remap("n", "<leader>run", function()
  local f = vim.bo.filetype
  vim.cmd(run_cmd_map[f] or string.format('echo "No run command given for %s files."', f))
end)
