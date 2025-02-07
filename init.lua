require('settings/settings')
require('settings/keymaps')
require('settings/lazy')

vim.cmd("colorscheme gruvbox")

vim.cmd([[set colorcolumn=85]])
vim.cmd([[hi CursorLine guibg=#303030]])

if vim.g.colors_name == "vim" then
   vim.cmd([[hi ColorColumn guibg=lightgrey]])
end
