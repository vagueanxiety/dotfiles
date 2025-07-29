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

-- Match inside selection
keyset('x', '<Leader>/', '<ESC>/\\%V')
