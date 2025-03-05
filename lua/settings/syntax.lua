vim.cmd([[set colorcolumn=85]])
vim.cmd([[hi CursorLine guibg=#303030]])

if vim.g.colors_name == "vim" then
   vim.cmd([[hi ColorColumn guibg=lightgrey]])
end

vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

local colors = {
   default = "#ffffff",
   red = "#ff1d23",
   gray = "#dadada",
   orange = "orange",
   light_orange ="#ffc7b1"
}

for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
   local hl = vim.api.nvim_get_hl(0, { name = group })

   if hl.fg then
      local color = colors.default

      if group == "Comment" then
         goto continue
      end

      if(group == "String") then
         color = colors.gray
      end

      if group == "DiagnosticError" then
         color = colors.red
      end

      if group == "DiagnosticWarn" then
         color = colors.orange
      end

      if group == "DiagnosticHint" or group == "DiagnosticInfo" then
         color = colors.light_orange
      end

      vim.cmd("hi " .. group .. " guifg=" .. color)
   end

   ::continue::
end
