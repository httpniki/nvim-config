return {
   'norcalli/nvim-colorizer.lua',
   event = "BufEnter",
   enabled = true,
   config = function()
      require('colorizer').setup()
   end
}
