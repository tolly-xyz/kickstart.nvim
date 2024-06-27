local remap = vim.keymap.set

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
end, { desc = 'Move focus to the left vim window or tmux pane' })

remap('n', '<C-l>', function()
  move_win_or_pane 'l'
end, { desc = 'Move focus to the right vim window or tmux pane' })

remap('n', '<C-j>', function()
  move_win_or_pane 'j'
end, { desc = 'Move focus to the lower vim window or tmux pane' })
remap('n', '<C-k>', function()
  move_win_or_pane 'k'
end, { desc = 'Move focus to the upper vim window or tmux pane' })

-- Remap this so that it doesn't interfere with <C-l> above
remap('n', '<C-q>', '<Plug>NetrwRefresh')
