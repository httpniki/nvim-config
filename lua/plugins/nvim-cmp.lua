return {
   "hrsh7th/nvim-cmp",
   dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-git",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs",
   },
   event = "VeryLazy",
   main = "settings.plugins.cmp-config",
   enabled = false,
   config = true,
}
