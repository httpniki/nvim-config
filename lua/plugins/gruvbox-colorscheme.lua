return {
   "ellisonleao/gruvbox.nvim",
   lazy = false,
   priority = 1000,
   enabled = true,
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
         contrast = "hard", --  "hard", "soft"
         palette_overrides = {},
         dim_inactive = false,
         transparent_mode = false,
      })
   end
}
