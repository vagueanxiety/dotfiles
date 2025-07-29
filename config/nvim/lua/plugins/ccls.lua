return {
  {
   "m-pilia/vim-ccls",
    init = function()
      local keyset = vim.keymap.set
      vim.g.ccls_close_on_jump = true
      keyset('n', '<Leader>gc', '*N :CclsCallHierarchy<CR>', {})
      keyset('n', '<Leader>gC', ':CclsCalleeHierarchy<CR>', {})
    end
  }
}
