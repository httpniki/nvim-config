require('settings/settings')
require('settings/keymaps')
-- require('settings/syntax')
require('settings/lazy')

vim.cmd[[colorscheme gruvbox]]

vim.api.nvim_create_user_command("HighlightGroupName", function ()
   local name = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1)), 'name')
   print(name)
end,{})
