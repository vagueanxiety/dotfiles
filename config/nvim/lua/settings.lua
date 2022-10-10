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
o.updatetime = 300
o.termguicolors = true
o.textwidth = 90
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.cursorline = true
o.list = true
o.listchars='tab:!·,trail:·,eol:↲'

-- global variables
vim.g.lightline = {colorscheme = 'nord'}

-- cmds
cmd('syntax on')
cmd('colorscheme nord')
