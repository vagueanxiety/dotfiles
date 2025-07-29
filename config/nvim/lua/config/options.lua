local g = vim.g
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

o.number = true
o.splitright = true
o.splitbelow = true
o.smartcase = true
o.ignorecase = true
o.clipboard = 'unnamedplus'
o.laststatus = 2
o.updatetime = 300
o.termguicolors = true
o.textwidth = 80
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.cursorline = true
o.list = true
o.listchars = 'tab:!·,trail:·,eol:↲'
o.showmode = false

-- For C and C++, use Kernel indentation style
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'c', 'cpp' },
  command = 'setlocal noexpandtab shiftwidth=8 tabstop=8'
})

cmd('syntax on')
