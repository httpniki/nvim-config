local popup = require("plenary.popup")
local M = {}

---@class Opts
---@field width integer
---@field height integer
---@field path string

---@class Data
---@field bufnr integer
---@field win_id integer

--- @param opts Opts
--- @return Data
M.open_floating_window = function(opts)
   local fn_data = {}

   local width = opts.width or 70
   local height = opts.height or 10

   fn_data.bufnr = vim.fn.bufnr(opts.path, true)

   fn_data.win_id = popup.create(fn_data.bufnr, {
      title = "TODOVIM: " .. opts.path,
      line = math.floor(((vim.o.lines - height) / 2) - 1),
      col = math.floor((vim.o.columns - width) / 2),
      minwidth = width,
      minheight = height,
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
   })

   return fn_data
end

return M
