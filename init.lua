-- nvim config in lua

require('settings.options')
require('settings.keymaps')
require('settings.lazy')
require('settings.colorscheme')

vim.cmd('set indentexpr=lispindent()')
