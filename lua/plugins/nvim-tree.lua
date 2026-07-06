local hidden_files = { "node_modules", ".dist", "dist", ".git", "package-lock.json", "target" }

return {
   "nvim-tree/nvim-tree.lua",
   keys = {
      { 'tt', "<cmd>NvimTreeFocus<CR>" },
   },
   config = function()
      local client = require("nvim-tree")

      --type client.config
      client.setup({
         view = {
            side = "right",
            width = 46,
            float = {
               enable = false,
               open_win_config = {
                  width = 100,
                  height = 40,
                  row = 2,
                  col = 70
               }
            }
         },
         filters = {
            enable = false,
            custom = hidden_files,
            dotfiles = false,
            git_ignored = false
         },
         live_filter = {
            always_show_folders = true
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
            group_empty = true,
            root_folder_label = function (path)
               local root_name = vim.fn.fnamemodify(path, ":t")

               return root_name
            end
         }
      })

      vim.keymap.set('n', 'tz', ':NvimTreeCollapse<CR>', {})
   end
}
