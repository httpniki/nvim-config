return {
   'tpope/vim-fugitive',
   cmd = { 'G', 'Git' },
   keys = {
      { '<leader>ga', ':Git fetch --all -p<CR>', desc = 'Git Fetch All' },
      { '<leader>gl', ':Git pull<cr>',           desc = 'Git pull' }
   },
   enabled = false
}
