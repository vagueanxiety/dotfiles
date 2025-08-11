return {
  {
    "neoclide/coc.nvim",
    branch = 'release',
    config = function ()
      -- Use autocmd to force lightline update.
      vim.cmd [[ autocmd User CocStatusChange,CocDiagnosticChange call lightline#update() ]]
    end,
    dependencies = {
      {
        "fannheyward/telescope-coc.nvim",
        config = function ()
          local keyset = vim.keymap.set
          keyset('n', '<Leader>gd', ':Telescope coc definitions<CR>', {})
          keyset('n', '<Leader>gD', ':Telescope coc declarations<CR>', {})
          keyset('n', '<Leader>gy', ':Telescope coc type_definitions<CR>', {})
          keyset('n', '<Leader>gr', ':Telescope coc references<CR>', {})
          keyset('n', '<Leader>gi', ':Telescope coc implementations<CR>', {})
          keyset("n", "<Leader>S", ':Telescope coc workspace_symbols<CR>', {})
          keyset("n", "<Leader>s", ':Telescope coc document_symbols<CR>', {})
          keyset("n", "<Leader>d", ':Telescope coc diagnostics<CR>', {})
          keyset("n", "<Leader>D", ':Telescope coc workspace_diagnostics<CR>', {})
          keyset('n', '<Leader>rn', '<Plug>(coc-rename)', opts)

          --keyset('n', '<Leader>gd', '<Plug>(coc-definition)', {})
          --keyset('n', '<Leader>gD', '<Plug>(coc-declaration)', {})
          --keyset('n', '<Leader>gy', '<Plug>(coc-type-definition)', {})
          --keyset('n', '<Leader>gr', '<Plug>(coc-references-used)', {})
          --keyset('n', '<Leader>gi', '<Plug>(coc-implementation)', {})
          --keyset('n', '<Leader>S', ':CocList -I -A symbols<CR>', {})
          --keyset('n', '<Leader>s', ':CocList -A outline<CR>', {})
          --keyset('n', '<Leader>D', ':CocList -A diagnostics<CR>', {})
        end,
      },
    },
  },
}
