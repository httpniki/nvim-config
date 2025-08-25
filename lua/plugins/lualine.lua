return {
   'nvim-lualine/lualine.nvim',
   dependencies = {
      { 'kyazdani42/nvim-web-devicons' },
   },
   config = function()
      local lualine = require('lualine')
      local custom_theme = require('lualine.themes.16color')

      custom_theme.normal.c.bg = 'None'

      require('lualine').hide({
         place = { 'statusline', 'tabline', 'winbar', 'neo-tree', 'filesystem' },
         unhide = false,
      })

      local config = {
         options = {
            globalstatus = true,
            component_separators = {},
            section_separators = {},
            theme = custom_theme
         },
         disabled_filetypes = {
            "packer",
            "neo-tree",
            "filesystem"
         },
         sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
               { "filename", path = 1 },
               {
                  'diagnostics',
                  sections = { 'error', 'warn', 'info' },
                  symbols = { error = ' ', warn = ' ', info = ' ' },
               },
            },
            lualine_x = {
               'diff',
               'location',
            },
            lualine_y = {},
            lualine_z = {},
         },
         inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
         }
      }

      lualine.setup(config)
   end
}
