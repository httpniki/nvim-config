local window = require("todovim.lua.window")

local M = {}
local utils = {}

--- @class Window
--- @field width integer
--- @field height integer

--- @class Options
--- @field target_file string
--- @field window Window

--- @param path string
utils.expand_path = function(path)
   if path:sub(1, 1) == '~' then
      return os.getenv('HOME') .. path:sub(2)
   end

   return path
end

--- @param opts Options
local function open_file(opts)
   local extended_path = utils.expand_path(opts.target_file)

   if vim.fn.filereadable(extended_path) == 0 then
      vim.notify("todo file does not exist at directori: " .. extended_path, vim.log.levels.ERROR)
   end

   local win = window.open_floating_window({
      width = opts.window.width,
      height = opts.window.height,
      path = extended_path,
   })

   if win.bufnr == -1 then
      win.bufnr = vim.api.nvim_create_buf(false, false)
      vim.api.nvim_buf_set_name(win.bufnr, extended_path)
   end

   -- vim.api.nvim_create_autocmd("BufLeave", {
   --    buffer = bufnr,
   --    callback = function()
   --       local current_win = vim.api.nvim_get_current_win()

   --       if current_win == win_id then
   --          vim.api.nvim_win_close(win_id, true)
   --       end

         -- if win ~= nil then
         --    popup.execute_callback(bufnr)
         --    -- vim.api.nvim_win_close(id, true)
         --    -- return "bdelete " .. bufnr
         -- end
      -- end
   -- })

   -- vim.api.nvim_create_user_command("TODOCLOSE", function()
   --    vim.api.nvim_win_close(win_id, true)
   -- end, {})
end

--- @param opts Options
local function setup_user_commands(opts)
   local target_file = opts.target_file or "TODO.md"

   vim.api.nvim_create_user_command("TODO", function()
      open_file(opts)
   end, {})
end

local function setup_user_keymaps()
   vim.api.nvim_set_keymap('n', 'Td', ':TODO<CR>', {})
end

--- @param opts Options
M.setup = function(opts)
   -- local target_path = opts.target_file or os.getenv("HOME") .. "/TODOVIM.md"
   -- local target_file = io.open(target_path, "w")

   -- if target_file == nil then
   --    vim.notify("TODOVIM.md file not found in " .. target_path, vim.log.levels.ERROR)
   -- end

   -- target_file:close()

   setup_user_commands(opts)
   setup_user_keymaps()
end

return M;
