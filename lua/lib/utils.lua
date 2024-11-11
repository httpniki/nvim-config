local module = {}

---@return number[]
function module.get_sorted_buf_list()
   local buf_list = vim.fn.tabpagebuflist()
   table.sort(buf_list)

   return buf_list
end

function module.delete_current_buff()
   local current_buff = vim.api.nvim_get_current_buf()

   vim.cmd('bnext')
   vim.api.nvim_buf_delete(current_buff, {})
end


return module
