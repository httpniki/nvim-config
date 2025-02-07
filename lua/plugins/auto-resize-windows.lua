return {
   "anuvyklack/windows.nvim",
   dependencies = {
      "anuvyklack/middleclass",
   },
   enabled = true,
   event = "WinEnter",
   config = function()
      vim.o.winwidth = 1
      vim.o.winminwidth = 1
      vim.o.equalalways = false

      require('windows').setup({})

      vim.keymap.set('n', '<C-w>m', ':WindowsMaximize<CR>')
   end
}
