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
o.showmode = false

-- colorscheme
g.nord_contrast = true
g.nord_borders = true
g.nord_italic = false
cmd('colorscheme nord')

-- lightline
g.lightline = { colorscheme = 'nord' }

-- telescope
local actions = require("telescope.actions")
require("telescope").setup({
  extensions = {
    coc = {
        prefer_locations = true,
    }
  },
  defaults = {
    mappings = {
        i = {
            ["<esc>"] = actions.close,
        },
    },
  },
})
require('telescope').load_extension('coc')

-- misc
cmd('syntax on')
