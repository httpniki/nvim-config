local hidden_files = require('lib.hidden-files')

return {
   'nvim-telescope/telescope.nvim',
   dependencies = {
      'nvim-lua/plenary.nvim',
      -- "nvim-telescope/telescope-file-browser.nvim",
      {
         'nvim-telescope/telescope-fzf-native.nvim',
         build = 'make'
      }
   },
   event = 'VeryLazy',
   keys = {
      {
         "ff",
         function()
            require('telescope.builtin').find_files({
               grep_open_files = true,
               previewer = false,
               hidden = true,
            })
         end,
         desc = 'Telescope find files'
      },
      -- {
      --    "fb",
      --    function()
      --       require('telescope.builtin').buffers()
      --    end,
      --    desc = 'Telescope buffers'
      -- },
      {
         "fw",
         function()
            require('telescope.builtin').grep_string({
               search = vim.fn.input("Grep > "),
            })
         end,
         desc = 'Telescope Find Word'
      },
      {
         "fl",
         function()
            require('telescope.builtin').live_grep({})
         end,
         desc = 'Telescope Find live Word'
      },
      {
         "<leader>gc",
         function()
            require("telescope.builtin").git_bcommits()
         end,
         desc = "Telescope Git Commits"
      },
      {
         "<leader>ht",
         function()
            require("telescope.builtin").help_tags()
         end,
         desc = "Telescope Help Tags"
      },
      --     {
      --        "tt",
      --        function()
      --           require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
      --        end,
      --        desc = "Telescope file browser"
      --     }
   },
   config = function()
      local opts = {
         pickers = {
            find_files = {
               -- path_display={"smart"}
            },
         },
         defaults = {
            file_ignore_patterns = { '.git', 'node_modules', '.cache', '.DS_Store', '.vscode', '.history', '__pycache__', 'dist', '.dist' },
            path_display = {
               "truncate"
            },
            dynamic_preview_title = true,
            preview = {
               timeout = 160
            }
         },
         extensions = {
            fzf = {
               fuzzy = true,
               override_generic_sorter = true,
               override_file_sorter = true,
               case_mode = "smart_case"
            },
         },
      }

      require("telescope").load_extension("fzf")
      require("telescope").setup(opts)
   end
}
