local hidden_files = { "node_modules", ".dist", "dist", ".git", "package-lock.json" }

return {
   "nvim-tree/nvim-tree.lua",
   config = function()
      local client = require("nvim-tree")

      client.setup({
         view = {
            width = 40,
         },
         filters = {
            enable = true,
            custom = hidden_files,
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
            indent_width = 4,
            indent_markers = {
               enable = true,
            },
            group_empty = true
         }
      })

      vim.keymap.set('n', 'tt', ':NvimTreeFocus<CR>', {})
      vim.keymap.set('n', 'tz', ':NvimTreeCollapse<CR>', {})
   end
}
