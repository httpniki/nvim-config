return {
   'nvim-treesitter/nvim-treesitter',
   build = ':TSUpdate',
   main = "nvim-treesitter.configs",
   enabled = true,
   event = 'VeryLazy',
   opts = {
      ensure_installed = {
         "lua",
         "vim",
         "vimdoc",
         "javascript",
         "typescript",
         "tsx",
         "java",
         "angular",
         "rust",
         "bash",
         "astro",
         "python",
         "c",
         "cpp",
         "css",
         "html",
         "json",
         "markdown",
         "xml",
         "html",
         "json",
         "kotlin"
      },
      highlight = {
         enable = true
      },
   },
}
