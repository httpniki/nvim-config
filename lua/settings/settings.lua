local g = vim.g
local opt = vim.opt

-- GENERAL
g.mapleader = ";"
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.ruler = true
opt.autoindent = true
opt.hlsearch = true
opt.showcmd = true

-- UI
vim.o.background = "dark" -- "dark", "light"
vim.wo.number = true
opt.title = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.cursorline = true
opt.incsearch = true
opt.numberwidth = 4
opt.number = true
opt.relativenumber = false
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.linebreak = true
opt.conceallevel = 0
opt.wrap = false
opt.termguicolors = true
opt.linespace = 0

--opt.textwidth = 900
--opt.linespace = 5
opt.pumheight = 10
-- opt.list = true
-- opt.listchars:append "space:⋅"
-- opt.listchars:append "eol:↴"

opt.expandtab = true
opt.shiftwidth = 3
opt.smartindent = true
opt.tabstop = 3
opt.softtabstop = 3

local has = function(x)
   return vim.fn.has(x) == 1
end

if has "macunix" then
   require("settings/macos")
end

if has "win32" then
   require("settings/windows")
end

if has "linux" then
   require("settings/linux")
end

vim.diagnostic.config({ signs = false })
