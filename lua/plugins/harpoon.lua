return {
   'ThePrimeagen/harpoon',
   keys = {
      {
         "<leader>ha",
         function()
            require("harpoon.mark").add_file()
         end,
         desc = "Harpoon add file"
      },
      {
         "<leader>hl",
         function()
            require("harpoon.ui").toggle_quick_menu()
         end,
         desc = "Harpoon toggle menu"
      },
      {
         "<leader>hn",
         function()
            require("harpoon.ui").nav_next()
         end,
         desc = "Harpoon next"
      },
      {
         "<leader>hp",
         function()
            require("harpoon.ui").nav_prev()
         end,
         desc = "Harpoon prev"
      },
   },
   opts = {
      menu = {
         width = vim.api.nvim_win_get_width(0) - 100,
      }
   }
}
