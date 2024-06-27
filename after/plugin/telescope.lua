local remap = vim.keymap.set

-- telescope
remap('n', '<leader>saf', function()
  require('telescope.builtin').find_files {
    find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
  }
end, { desc = '[S]earch [A]ll [F]iles' })
