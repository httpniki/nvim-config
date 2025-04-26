return {
   "supermaven-inc/supermaven-nvim",
   enabled = true,
   lazy = true,
   event = "VeryLazy",
   config = function()
      require("supermaven-nvim").setup({
         keymaps = {
            accept_suggestion = "<C-k>"
         }
      })
   end
}
