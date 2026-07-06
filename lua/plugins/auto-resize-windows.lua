return {
   "anuvyklack/windows.nvim",
   dependencies = {
      "anuvyklack/middleclass"
   },
   enabled = true,
   event = "WinEnter",
   config = function()
      require('windows').setup()

      vim.keymap.set('n', '<C-w>m', ':WindowsMaximize<CR>')
   end
}
