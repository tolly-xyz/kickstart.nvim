local npairs = require 'nvim-autopairs'
local Rule = require 'nvim-autopairs.rule'

npairs.add_rules { Rule('/**', '*/', { 'javascript', 'typescript' }), Rule('<', '>', { 'rust' }) }
