return {
   'saghen/blink.cmp',
   -- dependencies = { 'rafamadriz/friendly-snippets' },
   version = '1.*',
   opts = {
      keymap = { preset = 'default', ['<C-k>'] = false, ['<C-y>'] = { 'accept' } },
      appearance = {
         nerd_font_variant = 'normal'
      },
      completion = {
         ghost_text = { enabled = false },
         documentation = { auto_show = true },
         menu = {
            auto_show = true,
            draw = {
               columns = {
                  { "label", "label_description", "kind", gap = 1 }
               }
            }
         }
      },
      cmdline = { enabled = true },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
   }
}
