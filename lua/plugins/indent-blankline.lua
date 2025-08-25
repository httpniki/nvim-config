return {
   "lukas-reineke/indent-blankline.nvim",
   main = "ibl",
   event = "BufEnter",
   enabled = true,
   opts = {
      indent = {
         char = "▏"
      },
      scope = {
         enabled=false
      }
   }
}
