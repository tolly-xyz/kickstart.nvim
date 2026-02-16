local harpoon = require 'harpoon'
local remap = vim.keymap.set

-- REQUIRED
harpoon:setup {}
-- REQUIRED

-- Add current buffer to harpoon list
-- remap('n', '<leader>h', function()
--   harpoon:list():add()
-- end)
--
-- -- Open harpoon list menu
-- remap('n', '<C-S-h>', function()
--   harpoon.ui:toggle_quick_menu(harpoon:list())
-- end)
--
-- ---@param n integer The list number to navigate to
-- local nav_file = function(n)
--   harpoon:list():select(n)
-- end
--
-- remap('n', '<leader>1', function()
--   nav_file(1)
-- end)
--
-- remap('n', '<leader>2', function()
--   nav_file(2)
-- end)
--
-- remap('n', '<leader>3', function()
--   nav_file(3)
-- end)
--
-- remap('n', '<leader>4', function()
--   nav_file(4)
-- end)
