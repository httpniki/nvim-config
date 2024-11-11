require('settings/settings')
require('settings/keymaps')
require('settings/lazy')


-- vim.cmd("colorscheme vim")
vim.cmd("colorscheme gruvbox-material")

vim.cmd([[set colorcolumn=85]])

if vim.g.colors_name == "vim" then
   vim.cmd([[hi ColorColumn guibg=lightgrey]])
end
