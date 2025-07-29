return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      local g = vim.g
      local cmd = vim.cmd

      g.nord_contrast = true
      g.nord_borders = true
      g.nord_italic = false
      cmd([[colorscheme nord]])
    end,
  },
}
