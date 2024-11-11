return {
   'lewis6991/gitsigns.nvim',
   config = function()
      require('gitsigns').setup()
   end,
   opts = {
      numhl = true,
      max_file_length = 10000,
   }
}
