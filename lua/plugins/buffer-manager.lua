return {
   "j-morano/buffer_manager.nvim",
   dependencies = {
      'nvim-lua/plenary.nvim'
   },
   keys = {
      {
         'fb',
         function()
            require("buffer_manager.ui").toggle_quick_menu()
         end,
         desc = "Open buffer manager"
      }
   },
   opts = {
      width = 100,
      height = 12
   },
   enabled = true
}
