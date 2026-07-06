local map = vim.keymap
local signs = { Error = "", Warn = "", Hint = "", Info = "" }

local function format_buf()
   if vim.fn.exists(':EslintFixAll') > 0 then
      vim.cmd('EslintFixAll')
   else
      vim.lsp.buf.format { async = true }
   end
end

local on_attach = function(client, bufnr)
   local opts = { buffer = bufnr }

   client.server_capabilities.semanticTokensProvider = nil
   vim.lsp.handlers['textDocument/semanticTokens/full'] = nil
   vim.lsp.handlers['textDocument/semanticTokens/range'] = nil

   if (client.name ~= 'jdtls') then
      map.set('n', '<C-f>', format_buf, opts)
   end

   map.set('n', 'gd', vim.lsp.buf.definition, opts)
   map.set('n', 'gD', vim.lsp.buf.declaration, opts)
   map.set('n', 'gi', vim.lsp.buf.implementation, opts)
   map.set('n', 'gt', vim.lsp.buf.type_definition, opts)
   map.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
   map.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
   map.set('n', 'gr', vim.lsp.buf.references, opts)
end

return {
   "neovim/nvim-lspconfig",
   enabled = true,
   dependencies = {
      "williamboman/mason.nvim",
      "folke/neodev.nvim",
      'saghen/blink.cmp'
   },
   config = function()
      local lspconfig = require("lspconfig")
      local utils = require("lspconfig.util")
      require("neodev").setup()

      map.set('n', 'K', vim.lsp.buf.hover)
      map.set('n', '<Leader>e', vim.diagnostic.open_float)
      map.set('n', '<Leader>,', vim.diagnostic.goto_prev)
      map.set('n', '<Leader>.', vim.diagnostic.goto_next)
      map.set('n', '<Leader>q', vim.diagnostic.setloclist)

      vim.api.nvim_create_user_command(
         'Format',
         function()
            vim.lsp.buf.format { async = true }
         end,
         {}
      )

      vim.diagnostic.config({
         virtual_text = false,
         signs = {
            enable = true,
            text = {
               ["ERROR"] = signs.Error,
               ["WARN"] = signs.Warn,
               ["HINT"] = nil,
               ["INFO"] = nil,
            },
            texthl = {
               ["ERROR"] = "DiagnosticDefault",
               ["WARN"] = "DiagnosticDefault",
               ["HINT"] = nil,
               ["INFO"] = nil,
            },
            numhl = {
               ["ERROR"] = "DiagnosticDefault",
               ["WARN"] = "DiagnosticDefault",
               ["HINT"] = nil,
               ["INFO"] = nil,
            },
            severity_sort = true,
         },
      })

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
         virtual_text = true,
         signs = true,
         update_in_insert = false,
         underline = true,
      })

      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities.textDocument.completion.completionItem.snippetSupport = true
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.lsp.config('*', {
         on_attach = on_attach,
         capabilities = capabilities,
      })

      vim.lsp.enable('lua_ls')
      vim.lsp.config('lua_ls', {
         capabilities = capabilities,
         on_attach = on_attach,
         settings = {
            Lua = {
               telemetry = { enable = false },
               workspace = { checkThirdParty = false },
               diagnostics = { globals = { "vim" } }
            }
         }
      })

      vim.lsp.enable('ts_ls')
      vim.lsp.config('ts_ls', {
         on_attach = on_attach,
         cmd = { "typescript-language-server", "--stdio" },
         capabilities = capabilities,
         provideFormatter = true
      })

      vim.lsp.enable('tailwindcss')
      vim.lsp.enable('eslint')
      vim.lsp.config('eslint', {
         on_attach = on_attach,
         capabilities = capabilities,
         provideFormatter = false
      })

      vim.lsp.enable('html')
      vim.lsp.enable('cssls')
      --
      -- lspconfig.html.setup({
      --    on_attach = on_attach,
      --    capabilities = capabilities,
      --    provideFormatter = true
      -- })

      -- lspconfig.cssls.setup({
      --    on_attach = on_attach,
      --    capabilities = capabilities,
      --    cmd = { "vscode-css-language-server", "--stdio" },
      --    init_options = { provideFormatter = true },
      --    settings = {
      --       css = {
      --          validate = true,
      --          lint = {
      --             compatibleVendorPrefixes = "ignore",
      --             vendorPrefix = "ignore",
      --          },
      --       },
      --    }
      -- })

      -- vim.lsp.enable('angularls')
      -- vim.lsp.config('angularls', {
      --    on_attach = on_attach,
      --    capabilities = capabilities,
      --    provideFormatter = true
      -- })

      vim.lsp.enable('jdtls')
      vim.lsp.config('jdtls', {
         on_attach = on_attach,
         capabilities = capabilities,
         filetypes = { "java" },
         cmd = {
            "/home/nicolas/.local/share/nvim/mason/bin/jdtls",
            "--jvm-arg=-javaagent:/home/nicolas/.m2/repository/org/projectlombok/lombok/1.18.38/lombok-1.18.38.jar"
         },
         root_dir = vim.fn.getcwd()
      })

      vim.lsp.enable('jsonls')
      vim.lsp.config('jsonls', {
         on_attach = on_attach,
         capabilities = capabilities,
         cmd = { "vscode-json-language-server", "--stdio" },
         provideFormatter = true
      })

      -- lspconfig.rust_analyzer.setup({
      --    on_attach = on_attach,
      --    capabilities = capabilities
      -- })

      -- lspconfig.lemminx.setup({
      --    on_attach = on_attach,
      --    capabilities = capabilities,
      --    cmd = { "/home/nicolas/lemminx-language-server/org.eclipse.lemminx/target/lemminx-linux-x86_64-0.28.1-SNAPSHOT" },
      --    provideFormatter = true
      -- })

      -- lspconfig.bashls.setup({
      --    on_attach = on_attach,
      --    capabilities = capabilities,
      -- })

      -- lspconfig.astro.setup({
      --    on_attach = on_attach,
      --    capabilities = capabilities,
      -- })

      -- lspconfig.pyright.setup({
      --    on_attach = on_attach,
      --    capabilities = capabilities,
      -- })

      -- lspconfig.sourcekit.setup({
      --    on_attach = on_attach,
      --    capabilities = capabilities
      -- })

      -- lspconfig.clangd.setup({
      --    on_attach = on_attach,
      --    capabilities = capabilities
      -- })
      --
      vim.lsp.enable('kotlin_language_server')
      vim.lsp.config('kotlin_language_server', {
         cmd = { 'kotlin-language-server' },
         filetypes = { 'kotlin' }
      })

      vim.lsp.enable('omnisharp')
      vim.lsp.config('omnisharp', {
         filetypes = { 'cs' }
      })

      -- vim.lsp.enable('kotlin_lsp')
      -- vim.lsp.config('kotlin_lsp', {
      --    cmd = {"kotlin-lsp", "--stdio"},
      --    filetypes = { 'kotlin' },
      --    root_dir = utils.root_pattern("settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", "pom.xml", ".git")
      -- --    on_attach = on_attach,
      -- --    capabilities = capabilities,
      -- })

   end
}
