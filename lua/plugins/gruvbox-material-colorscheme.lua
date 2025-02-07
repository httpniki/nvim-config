return {
   "sainnhe/gruvbox-material",
   lazy = false,
   priority = 1000,
   enabled = false,
   config = function()
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "soft" -- hard, medium, soft
      vim.g.gruvbox_material_foreground = "original" -- material, mix, original,
   end
}
