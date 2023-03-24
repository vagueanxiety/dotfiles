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

-- colorscheme
g.nord_contrast = true
g.nord_borders = true
g.nord_italic = false
cmd('colorscheme nord')


-- For C and C++, use Kernel indentation style
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'c', 'cpp' },
  command = 'setlocal noexpandtab shiftwidth=8 tabstop=8'
})


-- lightline
g.lightline = { 
  colorscheme = 'nord',
  active = {
    right = {
      {'lineinfo'},
      {'percent'},
      {'cocstatus', 'fileformat', 'fileencoding', 'filetype'},
    }
  },
  component_function = {
    cocstatus = 'coc#status'
  }
}

-- Use autocmd to force lightline update.
cmd [[ autocmd User CocStatusChange,CocDiagnosticChange call lightline#update() ]]

-- telescope
local actions = require("telescope.actions")
require("telescope").setup({
  extensions = {
    coc = {
        prefer_locations = false,
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  defaults = {
    layout_config = {
        horizontal = { width = 0.9 }
    },
    preview = { timeout = 1000 },
    path_display = {"truncate"},
    mappings = {
        i = {
            ["<esc>"] = actions.close,
        },
    },
  },
})
require('telescope').load_extension('coc')
require('telescope').load_extension('fzf')

-- misc
cmd('syntax on')

-- startify
g.startify_change_to_dir = 0
