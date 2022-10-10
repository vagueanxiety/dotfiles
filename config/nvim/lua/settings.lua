local g = vim.g
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd

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
o.listchars = 'tab:!·,trail:·,eol:↲'

-- colorscheme
g.nord_contrast = true
g.nord_borders = false
g.nord_italic = false
cmd('colorscheme nord')

-- lightline
g.lightline = { colorscheme = 'nord' }

-- fzf
g.fzf_colors = { 
  ['fg'] = {'fg', 'Normal'},
  ['bg'] = {'bg', 'Normal'},
  ['hl'] = {'fg', 'Comment'},
  ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
  ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
  ['hl+'] = {'fg', 'Statement'},
  ['info'] = {'fg', 'PreProc'},
  ['border'] = {'fg', 'Ignore'},
  ['prompt'] = {'fg', 'Conditional'},
  ['pointer'] = {'fg', 'Exception'},
  ['marker'] =  {'fg', 'Keyword'},
  ['spinner'] = {'fg', 'Label'},
  ['header'] =  {'fg', 'Comment'}
}
g.fzf_layout = { window = { width = 0.9, height = 0.9 }}

-- misc
cmd('syntax on')
