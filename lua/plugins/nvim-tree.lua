local hidden_files = { "node_modules", ".dist", "dist", ".git", "package-lock.json", "target" }

return {
   "nvim-tree/nvim-tree.lua",
   enabled = true,
   keys = {
      { 'tt', "<cmd>NvimTreeFocus<CR>" },
   },
   config = function()
      local client = require("nvim-tree")
      vim.opt.termguicolors = true

      local gheight = vim.api.nvim_list_uis()[1].height
      local gwidth = vim.api.nvim_list_uis()[1].width
      local width = 80
      local height = 28

      client.setup({
         view = {
            side = "left",
            width = 46,
            centralize_selection = true,
            cursorline = true,
            float = {
               enable = false,
               open_win_config = {
                  relative = "editor",
                  border = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" },
                  style = "minimal",
                  width = width,
                  height = height,
                  row = (gheight - height) * 0.5,
                  col = (gwidth - width) * 0.5
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
            indent_width = 5,
            indent_markers = {
               enable = true,
            },
            group_empty = true,
            -- root_folder_label = function(path)
            --    local root_name = vim.fn.fnamemodify(path, ":t")

            --    return root_name
            -- end
         }
      })

      vim.keymap.set('n', 'tz', ':NvimTreeCollapse<CR>', {})
   end
}
