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

-- Remove trailing spaces
keyset('n', '<Leader>ws', [[:%s/\s\+$//e<cr>]])

-- Highlight keyword
keyset('n', '<Leader>q', '*N')

-- Search inside selection
keyset('x', '<Leader>/', '<ESC>/\\%V')

-- Search around curly brackets
keyset('n', '<Leader>ga', 'va{<Esc>/\\%V', {})

-- Show docs for the current word
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
keyset('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- FIX: remove bpg dep
-- Generate breakpoints from the quickfix list
function _G.generate_breakpoints()
  if vim.bo.buftype == 'quickfix' then
    vim.cmd('set ma');
    vim.cmd('%!bpg');
  end
end
keyset('n', '<Leader>bp', '<CMD>lua _G.generate_breakpoints()<CR>', {})


