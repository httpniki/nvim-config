return {
   "windwp/nvim-ts-autotag",
   ft = { "jsx", "tsx", "html", "astro" },
   opts = {
      enable_close = true,         -- Auto close tags
      enable_rename = true,        -- Auto rename pairs of tags
      enable_close_on_slash = true -- Auto close on trailing </
   },
}
