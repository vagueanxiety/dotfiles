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
            {'cocstatus', 'fileformat', 'fileencoding', 'filetype'},
          }
        },
        component_function = {
          cocstatus = 'coc#status',
        }
      }
    end,
  },
}
