local hidden_files = require('lib.hidden-files')

return {
   "nvim-neo-tree/neo-tree.nvim",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
   },
   enabled = false,
   keys = {
      {
         'tt',
         ':Neotree toggle<CR>',
         desc = 'neo-tree toggle'
      },
      { 'tb', ':Neotree buffers float<CR>', desc = 'neotree buffer toggle' }
   },
   config = function()
      vim.api.nvim_create_autocmd('BufEnter', {
         callback = function()
            local bufnr = vim.api.nvim_get_current_buf()
            local bufname = vim.api.nvim_buf_get_name(bufnr)

            print(bufname)

            if vim.fn.exists('Neotree') == 0 then
               vim.cmd [[Neotree close]]
            end
         end
      })

      require('neo-tree').setup({
         hide_root_node = true,
         source_selector = {
            winbar = false,
            statusline = false,
         },
         close_if_last_window = true,
         popup_border_style = "rounded",
         enable_git_status = true,
         enable_diagnostics = true,
         sort_case_insensitive = false,
         sort_function = nil,
         default_component_configs = {
            container = {
               enable_character_fade = true
            },
            indent = {
               indent_size = 3,
               padding = 1,
               with_markers = true,
               indent_marker = "│",
               last_indent_marker = "└",
               highlight = "NeoTreeIndentMarker",
               with_expanders = nil,
               expander_collapsed = "",
               expander_expanded = "",
               expander_highlight = "NeoTreeExpander",
            },
            icon = {
               -- folder_closed = "+",
               -- folder_open = "-",
               --
               folder_closed = "",
               folder_open = "",
               -- --
               -- folder_closed = "",
               -- folder_open = "",

               folder_empty = "ﰊ",
               default = "*",
               highlight = "NeoTreeFileIcon"
            },
            modified = {
               symbol = "*",
               highlight = "NeoTreeModified",
            },
            name = {
               trailing_slash = false,
               use_git_status_colors = true,
               highlight = "NeoTreeFileName",
            },
            git_status = {
               symbols = {
                  added     = "✚",
                  modified  = "",
                  deleted   = "✖",
                  renamed   = "",
                  untracked = "",
                  ignored   = "",
                  unstaged  = "",
                  staged    = "",
                  conflict  = "",
               }
            },
            file_size = { enabled = true },
            created = { enabled = true },
            type = { enabled = true },
            last_modified = { enabled = true }
         },
         window = {
            hidden = true,
            position = "right",
            width = 40,
            mapping_options = {
               noremap = true,
               nowait = true,
            },
            mappings = {
               ["<space>"] = {
                  "toggle_node",
                  nowait = false,
               },
               ["<2-LeftMouse>"] = "open",
               ["<cr>"] = "open",
               ["<esc>"] = "revert_preview",
               ["f3"] = { "toggle_preview", config = { use_float = true } },
               ["l"] = "focus_preview",
               ["S"] = "open_split",
               ["s"] = "open_vsplit",
               -- ["S"] = "split_with_window_picker",
               -- ["s"] = "vsplit_with_window_picker",
               ["t"] = "open_tabnew",
               -- ["<cr>"] = "open_drop",
               -- ["t"] = "open_tab_drop",
               ["w"] = "open_with_window_picker",
               -- ["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
               ["C"] = "close_node",
               ["z"] = "close_all_nodes",
               --["Z"] = "expand_all_nodes",
               ["a"] = {
                  "add",
                  config = {
                     show_path = "none" -- "none", "relative", "absolute"
                  }
               },
               ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
               ["d"] = "delete",
               ["r"] = "rename",
               ["y"] = "copy_to_clipboard",
               ["x"] = "cut_to_clipboard",
               ["p"] = "paste_from_clipboard",
               ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
               -- ["c"] = {
               --  "copy",
               --  config = {
               --    show_path = "none" -- "none", "relative", "absolute"
               --  }
               --}
               ["m"] = "move",
               ["q"] = "close_window",
               ["R"] = "refresh",
               ["?"] = "show_help",
               ["<"] = "prev_source",
               [">"] = "next_source",
            }
         },
         nesting_rules = {},
         filesystem = {
            follow_current_file = {
               enabled = true,
               leave_dirs_open = false,
            },
            filtered_items = {
               visible = true,
               hide_dotfiles = false,
               hide_gitignored = false,
               hide_hidden = false,
               hide_by_name = {},
               hide_by_pattern = {},
               always_show = {},
               never_show = hidden_files.HIDDEN_FILES,
               never_show_by_pattern = {},
            },
            group_empty_dirs = false,               -- when true, empty folders will be grouped together
            hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
            -- in whatever position is specified in window.position
            -- "open_current",  -- netrw disabled, opening a directory opens within the
            -- window like netrw would, regardless of window.position
            -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
            use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
            -- instead of relying on nvim autocmd events.
            window = {
               mappings = {
                  ["<bs>"] = "navigate_up",
                  ["."] = "set_root",
                  ["H"] = "toggle_hidden",
                  ["/"] = "fuzzy_finder",
                  ["D"] = "fuzzy_finder_directory",
                  ["ft"] = "filter_on_submit",
                  ["<c-x>"] = "clear_filter",
                  ["[g"] = "prev_git_modified",
                  ["]g"] = "next_git_modified",
               }
            }
         },

         buffers = {
            follow_current_file = { enabled = true },
            group_empty_dirs = false,
            show_unloaded = true,
            window = {
               mappings = {
                  ["bd"] = "buffer_delete",
                  ["<bs>"] = "navigate_up",
                  ["."] = "set_root",
               }
            },
         },
      })
   end,
}
