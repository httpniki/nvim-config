local bufnr = function()
   local bufnr = vim.fn.bufnr()
   return "<buff " .. bufnr .. ">"
end

return {
   'nvim-lualine/lualine.nvim',
   dependencies = {
      { 'kyazdani42/nvim-web-devicons' },
   },
   enabled = true,
   config = function()
      local lualine = require('lualine')

      require('lualine').hide({
         place = { 'statusline', 'tabline', 'winbar', 'neo-tree', 'filesystem' },
         unhide = false,
      })

      local config = {
         options = {
            globalstatus = true,
            -- component_separators = { left = '', right = '' },
            component_separators = {},
            -- section_separators = { left = '', right = '' },
            section_separators = {},
            theme = 'auto'
         },
         disabled_filetypes = {
            "packer",
            "neo-tree",
            "filesystem"
         },
         sections = {
            lualine_a = {},
            lualine_b = { bufnr },
            lualine_c = {
               { "filename", path = 1 },
               {
                  'diagnostics',
                  sections = { 'error', 'warn', 'info' },
                  symbols = { error = ' ', warn = ' ', info = ' ' },
               }
            },
            lualine_x = {
               'diff',
               'filetype'
            },
            lualine_y = { 'branch' },
            lualine_z = { "location" },
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
