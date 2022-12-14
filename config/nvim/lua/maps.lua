local g = vim.g
local keyset = vim.keymap.set

-- Leader
keyset('n', '<Space>', '<Nop>', { silent = false })
g.mapleader = ' '

-- Splits
keyset('n', '<C-j>', '<C-w>j', { silent = false })
keyset('n', '<C-k>', '<C-w>k', { silent = false })
keyset('n', '<C-h>', '<C-w>h', { silent = false })
keyset('n', '<C-l>', '<C-w>l', { silent = false })

-- Telescope
local builtin = require('telescope.builtin')
keyset('n', '<Leader>e', builtin.find_files, {})
keyset('n', '<Leader>b', builtin.buffers, {})
keyset('n', '<Leader>f', builtin.live_grep, {})
keyset('n', '<Leader>F', builtin.grep_string, {})
keyset('n', '<Leader>m', builtin.marks, {})
keyset('n', '<Leader>M', ':Telescope man_pages sections=ALL<CR>', {})

-- sadly CTRL-I/O do not work properly within the same file using telescope-coc
--keyset('n', '<Leader>gd', ':Telescope coc definitions<CR>', {})
--keyset('n', '<Leader>gi', ':Telescope coc implementation<CR>', {})
--keyset('n', '<Leader>gr', ':Telescope coc references<CR>', {})
--keyset("n", "<Leader>s", ':Telescope coc document_symbols<CR>', {})
--keyset("n", "<Leader>S", ':Telescope coc workspace_symbols<CR>', {})
--keyset("n", "<Leader>d", ':Telescope coc diagnostics<CR>', {})
--keyset("n", "<Leader>D", ':Telescope coc workspace_diagnostics<CR>', {})

keyset('n', '<Leader>gd', '<Plug>(coc-definition)', {})
keyset('n', '<Leader>gD', '<Plug>(coc-declaration)', {})
keyset('n', '<Leader>gy', '<Plug>(coc-type-definition)', {})
keyset('n', '<Leader>gr', '<Plug>(coc-references)', {})
keyset('n', '<Leader>gi', '<Plug>(coc-implementation)', {})
keyset('n', '<Leader>s', ':CocList -I -A symbols<CR>', {})
keyset('n', '<Leader>S', ':CocList -A outline<CR>', {})
keyset('n', '<Leader>d', ':CocList -A --normal diagnostics<CR>', {})

-- Coc
local opts = {silent = true, nowait = true}
keyset('n', '<Leader>rn', '<Plug>(coc-rename)', opts)
keyset('x', '<Leader>a', '<Plug>(coc-codeaction-selected)', opts)
keyset('n', '<Leader>a', '<Plug>(coc-codeaction-cursor)', opts)
keyset('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') 
      and vim.fn.CocAction('hasProvider',  'hover') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.fn.feedkeys('K', 'in')
    end
end

-- Leap.vim
require('leap').set_default_keymaps()

