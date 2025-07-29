return {
  {
    "itchyny/lightline.vim",
    init = function()
      vim.g.lightline = {
        colorscheme = 'nord',
        active = {
          right = {
            {'lineinfo'},
            {'percent'},
            {'fileformat', 'fileencoding', 'filetype'},
          }
        },
      }
    end,
  },
}
