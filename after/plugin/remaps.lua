-- reference for mapping commands
-- https://stackoverflow.com/q/3776117/17997341

-- inspiration taken from ThePrimeagen
-- https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/after/plugin/keymap/init.lua

local remap = vim.keymap.set

-- jumps and vertical movement
remap('n', '<C-o>', '<C-o>zz')
remap('n', '<C-i>', '<C-i>zz')
remap('n', '<C-u>', '<C-u>zz')
remap('n', '<C-d>', '<C-d>zz')
remap('n', 'n', 'nzz')
remap('n', 'N', 'Nzz')

-- Open netrw
remap('n', '-', ':Ex<CR>')

-- yank to system clipboard
remap('', '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })

-- delete to blackhole instead of default register
remap('', '<leader>d', '"_d', { desc = '[D]elete to black hole register' })

-- paste over highlighted text, keep pasted text in register
remap('x', '<leader>p', '"_dP', { desc = '[P]aste over selection, delete to black hole register' })

-- Repeatable commands
local ts_repeat_move = require 'nvim-treesitter-textobjects.repeatable_move'

remap({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
remap({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
remap({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
remap({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
remap({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
remap({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

local repeat_move = require 'repeatable_move'

-- go to next quickfix list item
local function next_qflist()
  if vim.fn.getqflist({ winid = 0 }).winid > 0 then vim.cmd.cnext() end
end

-- go to prev quickfix list item
local function prev_qflist()
  if vim.fn.getqflist({ winid = 0 }).winid > 0 then vim.cmd.cprevious() end
end

local next_qflist_repeat, prev_qflist_repeat = repeat_move.make_repeatable_move_pair(next_qflist, prev_qflist)
remap('n', ']q', next_qflist_repeat, { desc = 'Next [q]uickfix list item' })
remap('n', '[q', prev_qflist_repeat, { desc = 'Previous [q]uickfix list item' })

-- go to next location list item
local function next_loclist()
  if vim.fn.getloclist(0, { winid = 0 }).winid > 0 then vim.cmd.lnext() end
end

-- go to prev location list item
local function prev_loclist()
  if vim.fn.getloclist(0, { winid = 0 }).winid > 0 then vim.cmd.lprevious() end
end

local next_loclist_repeat, prev_loclist_repeat = repeat_move.make_repeatable_move_pair(next_loclist, prev_loclist)
remap('n', ']l', next_loclist_repeat, { desc = 'Next [l]ocation list item' })
remap('n', '[l', prev_loclist_repeat, { desc = 'Previous [l]ocation list item' })
