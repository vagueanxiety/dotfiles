local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd

-- global options
o.number = true
o.splitright = true
o.splitbelow = true
o.smartcase = true
o.ignorecase = true
o.clipboard = 'unnamedplus'
o.laststatus = 2
o.updatetime = 750
o.termguicolors = true

-- window-local options
wo.number = true
wo.cursorline = true
wo.list = true
wo.listchars='tab:!·,trail:·,eol:↲'

-- buffer-local options
bo.textwidth = 90
bo.expandtab = true
bo.shiftwidth = 2
bo.tabstop = 2
bo.softtabstop = 2

-- global variables
vim.g.lightline = {colorscheme = 'nord'}

-- cmds
cmd('syntax on')
cmd('colorscheme nord')
