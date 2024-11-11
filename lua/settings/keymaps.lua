local utils = require("lib.utils")

local map = vim.api.nvim_set_keymap
local default_ops = { noremap = true, silent = true }

map('n', '<Space>', '<nop>', { noremap = false })
vim.g.mapleader = " "

-- clear search hightlight
map('n', '<Space>n', ':noh<CR>', default_ops)

vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', ':w<CR>', { noremap = true })

--buffers
map('n', '.', ':bnext<CR>', { noremap = true })
map('n', ',', ':bprevious<CR>', { noremap = true })

vim.keymap.set('n', '<Leader>-', utils.delete_current_buff, default_ops)

--tabs
map('n', '[', '<Cmd>tabp<CR>', { noremap = true })
map('n', ']', '<Cmd>tabn<CR>', { noremap = true })
map('n', '_', '<Cmd>tabclose<CR>', { noremap = true })

-- resize windows
map('n', '<C-S-Left>', '<C-w><', default_ops)
map('n', '<C-S-Right>', '<C-w>>', default_ops)
map('n', '<C-S-Up>', '<C-w>+', default_ops)
map('n', '<C-S-Down>', '<C-w>-', default_ops)
--
-- move cursor on windows
map('n', '<C-w>k', ':winc k<CR>', default_ops)
map('n', '<C-w>j', ':winc j<CR>', default_ops)
map('n', '<C-w>h', ':winc h<CR>', default_ops)
map('n', '<C-w>l', ':winc l<CR>', default_ops)

-- move windows position
map('n', '<C-w><C-k>', ':wincmd K<CR>', default_ops)
map('n', '<C-w><C-j>', ':wincmd J<CR>', default_ops)
map('n', '<C-w><C-h>', ':wincmd H<CR>', default_ops)
map('n', '<C-w><C-l>', ':wincmd L<CR>', default_ops)

map('n', '<C-w><C-Up>', ':wincmd K<CR>', default_ops)
map('n', '<C-w><C-Down>', ':wincmd J<CR>', default_ops)
map('n', '<C-w><C-Left>', ':wincmd H<CR>', default_ops)
map('n', '<C-w><C-Right>', ':wincmd L<CR>', default_ops)

-- undo
map('n', '<C-z>', ':undo<CR>', { noremap = true })
vim.keymap.set({ 'i', 'v' }, '<C-z>', ':undo<CR>', { noremap = true })

local function show_numbers()
   vim.cmd('lua vim.opt.relativenumber=false')
   vim.cmd('lua vim.opt.number=true')
end

local function show_relativenumbers()
   vim.cmd('lua vim.opt.relativenumber=true')
   vim.cmd('lua vim.opt.number=true')
end

local function hidde_number_line()
   vim.cmd('lua vim.opt.relativenumber=false')
   vim.cmd('lua vim.opt.number=false')
end

vim.keymap.set({ 'n', 'i' }, '<F1>', show_numbers, { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<F2>', show_relativenumbers, { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<F3>', hidde_number_line, { noremap = true })
