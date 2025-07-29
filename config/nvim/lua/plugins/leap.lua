return {
  {
    "ggandor/leap.nvim",
    init = function()
      local keyset = vim.keymap.set
      keyset({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
      keyset({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
      vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
    end,
  },
}
