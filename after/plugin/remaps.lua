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

-- yank to system clipboard
remap('', '<leader>y', '"+y')

-- delete to blackhole instead of default register
remap('', '<leader>d', '"_d')

-- paste over highlighted text, keep pasted text in register
remap('x', '<leader>p', '"_dP')

-- telescope
remap('n', '<leader>saf', function()
  require('telescope.builtin').find_files {
    find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
  }
end, { desc = '[S]earch [A]ll [F]iles' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands

local function move_win_or_pane(direction)
  local win_num = vim.fn.winnr()

  pcall(vim.cmd.wincmd, direction)

  -- If the vim window number changed, exit
  if win_num ~= vim.fn.winnr() then
    return
  end

  -- If the vim window didn't change, switch tmux pane
  local tmux_map = {
    h = '-L',
    j = '-D',
    k = '-U',
    l = '-R',
  }

  local tmux_direction = tmux_map[direction]
  pcall(vim.system, { 'tmux', 'select-pane', tmux_direction })
end

remap('n', '<C-h>', function()
  move_win_or_pane 'h'
end, { desc = 'Move focus to the left window' })

remap('n', '<C-l>', function()
  move_win_or_pane 'l'
end, { desc = 'Move focus to the right window' })

remap('n', '<C-j>', function()
  move_win_or_pane 'j'
end, { desc = 'Move focus to the lower window' })
remap('n', '<C-k>', function()
  move_win_or_pane 'k'
end, { desc = 'Move focus to the upper window' })

-- Remap this so that it doesn't interfere with <C-l> above
remap('n', '<C-q>', '<Plug>NetrwRefresh')
