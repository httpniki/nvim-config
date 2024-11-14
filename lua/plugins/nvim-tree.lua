return {
   "nvim-tree/nvim-tree.lua",
   config = function()
      local client = require("nvim-tree")

      client.setup({
         view = {
            width = 40,
         },
         filters = {
            enable = false
         },
         live_filter = {
            always_show_folders = false
         },
         hijack_directories = {
            enable = false,
            auto_open = false,
         },
         update_focused_file = {
            enable = true
         },
         renderer = {
            indent_width = 3,
            indent_markers = {
               enable = true,
            }
         }
      })

      vim.keymap.set('n', 'tt', ':NvimTreeFocus<CR>', {})
   end
}
