return {
   'nvim-treesitter/nvim-treesitter',
   build = ':TSUpdate',
   main = "nvim-treesitter.configs",
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
      },
      highlight = {
         enable = true
      },
   },
}
