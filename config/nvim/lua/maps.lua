local g = vim.g

-- Leader
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { silent = false })
g.mapleader = ' '

-- Splits
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = false })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = false })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = false })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = false })

-- Fzf
g.fzf_layout = { window = { width = 0.9, height = 0.9 }}
vim.api.nvim_set_keymap('n', '<Leader>e', ':Files<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', ':Buffers<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':Rg<CR>', { silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<Leader>F', ':Find<CR>', { silent = true })

vim.api.nvim_create_user_command('Find', "call fzf#vim#grep("..
"'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(expand('<cword>')),"..
"1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)", { nargs = '*' })

-- Coc
vim.api.nvim_set_keymap('n', '<Leader>rn', '<Plug>(coc-rename)', { silent = false })
vim.api.nvim_set_keymap('n', '<Leader>gd', '<Plug>(coc-definition)', { silent = false })
vim.api.nvim_set_keymap('n', '<Leader>gr', '<Plug>(coc-references)', { silent = false })
vim.api.nvim_set_keymap('n', '<Leader>gi', '<Plug>(coc-implementation)', { silent = false })

vim.api.nvim_set_keymap('x', '<Leader>a', '<Plug>(coc-codeaction-selected)', { silent = false })
vim.api.nvim_set_keymap('n', '<Leader>a', '<Plug>(coc-codeaction-selected)', { silent = false })

vim.api.nvim_set_keymap("n", "<Leader>d", ":<C-u>CocList diagnostics<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>s", ":<C-u>CocList outline<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>S", ":<C-u>CocList -I symbols<cr>", { silent = true })

vim.api.nvim_set_keymap('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })
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

