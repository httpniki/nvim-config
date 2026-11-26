return {
   "nvim-telescope/telescope-file-browser.nvim",
   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
   enabled = false,
   config = function()
      local telescope = require("telescope")

      telescope.setup {
         extensions = {
            file_browser = {
               grouped = true,
               sort_by = "name",
               files = true,
               hidden = { file_browser = true, folder_browser = true },
            }
         }
      }

      telescope.load_extension("file_browser")

      vim.keymap.set("n", "tt", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
   end
}
