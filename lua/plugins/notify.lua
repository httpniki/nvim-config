return {
   "rcarriga/nvim-notify",
   setup = function()
      local notify = require("notify")

      notify.setup({
         merge_duplicates = false,
         background_colour = "#000000",
         timeout = 3000,
         stages = "fade",
         icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
         },
      })

      vim.notify = notify

      -- Redirigir mensajes de error de Neovim a notify
      vim.api.nvim_create_autocmd("LspAttach", {
         callback = function()
            vim.api.nvim_set_option("shortmess", vim.o.shortmess .. "c")
         end,
      })

      -- Sobrescribir las funciones de error / warn para que usen notify
      vim.api.nvim_err_writeln = function(msg)
         notify(msg, "error", { title = "Neovim Error" })
      end

      vim.api.nvim_out_write = function(msg)
         notify(msg, "info", { title = "Neovim Message" })
      end

      vim.api.nvim_err_write = function(msg)
         notify(msg, "warn", { title = "Neovim Warning" })
      end
   end,
}
