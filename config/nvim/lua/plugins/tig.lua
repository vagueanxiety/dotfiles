return {
  {
    "iberianpig/tig-explorer.vim",
    dependencies = {
      "rbgrouleff/bclose.vim",
    },
    init = function()
      local keyset = vim.keymap.set
      keyset('n', '<Leader>bl', ':TigBlame<CR>', {})
      keyset('n', '<Leader>t', ':Tig<CR>', {})
    end
  },
}
