require('settings/settings')
require('settings/keymaps')
require('settings/lazy')
-- require('settings/syntax')

vim.o.background = "dark"
vim.cmd [[colorscheme gruvbox]]

if vim.o.background == "dark" then
   vim.cmd([[hi CursorLine guibg=#303030]])
end

-- vim.cmd [[colorscheme rose-pine]]
-- vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

vim.cmd([[set colorcolumn=85]])

