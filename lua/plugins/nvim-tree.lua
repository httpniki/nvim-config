local hidden_files = { "node_modules", ".dist", "dist", ".git", "package-lock.json", "target" }

return {
   "nvim-tree/nvim-tree.lua",
   keys = {
      { 'tt', "<cmd>NvimTreeFocus<CR>" },
   },
   config = function()
      local client = require("nvim-tree")

      client.setup({
         view = {
            float = {
               enable = true,
               open_win_config = {
                  width = 80,
                  height = 30,
                  row = 2,
                  col = 50
               }
            }
         },
         filters = {
            enable = true,
            custom = hidden_files,
            dotfiles = false,
            git_ignored = false
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

      vim.keymap.set('n', 'tz', ':NvimTreeCollapse<CR>', {})
   end
}
