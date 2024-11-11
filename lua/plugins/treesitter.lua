return {
   'nvim-treesitter/nvim-treesitter',
   build = ':TSUpdate',
   main = "nvim-treesitter.configs",
   event = 'VeryLazy',
   opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "tsx", "java", "angular" },
      highlight = {
         enable = true,
      },
   },
}
