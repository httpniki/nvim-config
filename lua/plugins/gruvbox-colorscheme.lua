return {
   "ellisonleao/gruvbox.nvim",
   lazy = false,
   priority = 1000,
   enabled = false,
   config = function()
      require('gruvbox').setup({
         undercurl = true,
         underline = true,
         bold = true,
         italic = {
            strings = true,
            comments = true,
            operators = false,
            folds = true,
         },
         strikethrough = true,
         invert_selection = false,
         invert_signs = false,
         invert_tabline = false,
         invert_intend_guides = false,
         inverse = true,
         contrast = "soft", --  "hard", "soft"
         palette_overrides = {},
         dim_inactive = false,
         transparent_mode = true,
      })
   end
}
