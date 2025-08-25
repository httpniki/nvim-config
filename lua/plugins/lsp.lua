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

   -- if (client.server_capabilities.semanticTokensProvider) then
      client.server_capabilities.semanticTokensProvider = nil
      -- vim.lsp.handlers['textDocument/semanticTokens/full'] = nil
      -- vim.lsp.handlers['textDocument/semanticTokens/range'] = nil
   -- end

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
         virtual_text = true,
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
          -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local capabilities = require('blink.cmp').get_lsp_capabilities()


      lspconfig.lua_ls.setup({
         capabilities = capabilities,
         on_attach = on_attach,
         settings = {
            Lua = {
               telemetry = { enable = false },
               workspace = { checkThirdParty = false }
            }
         }
      })

      lspconfig.ts_ls.setup({
         on_attach = on_attach,
         cmd = { "typescript-language-server", "--stdio" },
         capabilities = capabilities,
      })

      lspconfig.eslint.setup({
         on_attach = on_attach,
      })

      lspconfig.tailwindcss.setup({
         on_attach = on_attach,
      })

      lspconfig.html.setup({
         on_attach = on_attach,
         capabilities = capabilities,
         provideFormatter = true
      })

      lspconfig.cssls.setup({
         on_attach = on_attach,
         capabilities = capabilities,
         cmd = { "vscode-css-language-server", "--stdio" },
         init_options = { provideFormatter = true },
         settings = {
            css = {
               validate = true,
               lint = {
                  compatibleVendorPrefixes = "ignore",
                  vendorPrefix = "ignore",
               },
            },
         }
      })

      lspconfig.angularls.setup({
         on_attach = on_attach,
         capabilities = capabilities,
         provideFormatter = true
      })

      lspconfig.jdtls.setup({
         on_attach = on_attach,
         capabilities = capabilities,
         filetypes = { "java" },
         cmd = {
            "/home/nicolas/.local/share/nvim/mason/bin/jdtls",
            "--jvm-arg=-javaagent:/home/nicolas/.m2/repository/org/projectlombok/lombok/1.18.38/lombok-1.18.38.jar"
         },
         root_dir = vim.fn.getcwd(),
      })

      lspconfig.jsonls.setup({
         on_attach = on_attach,
         capabilities = capabilities,
         cmd = { "vscode-json-language-server", "--stdio" },
         provideFormatter = true
      })

      lspconfig.rust_analyzer.setup({
         on_attach = on_attach,
         capabilities = capabilities
      })

      lspconfig.lemminx.setup({
         on_attach = on_attach,
         capabilities = capabilities,
         cmd = { "/home/nicolas/lemminx-language-server/org.eclipse.lemminx/target/lemminx-linux-x86_64-0.28.1-SNAPSHOT" },
         provideFormatter = true
      })

      lspconfig.bashls.setup({
         on_attach = on_attach,
         capabilities = capabilities,
      })

      lspconfig.astro.setup({
         on_attach = on_attach,
         capabilities = capabilities,
      })

      lspconfig.pyright.setup({
         on_attach = on_attach,
         capabilities = capabilities,
      })

      lspconfig.sourcekit.setup({
         on_attach = on_attach,
         capabilities = capabilities
      })

      lspconfig.clangd.setup({
         on_attach = on_attach,
         capabilities = capabilities
      })

      lspconfig.kotlin_language_server.setup({
         on_attach = on_attach,
         capabilities = capabilities
      })
      
      -- lspconfig.kotlin_lsp.setup({
      --    on_attach = on_attach,
      --    capabilities = capabilities,
      --    cmd = { "kotlin-lsp", "--stdio" },
      --    filetypes = { "kotlin" },
      --    root_markers = { "settings.gradle", "settings.gradle.kts", "pom.xml", "build.gradle", "build.gradle.kts", "workspace.json" }
      -- })
   end
}
