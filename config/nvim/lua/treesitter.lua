require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'cpp', 'rust', 'zig' },
  auto_install = true,
  textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
  },
}
