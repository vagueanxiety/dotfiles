return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  use {'wincent/loupe'}
  use {'junegunn/fzf', run = ":call fzf#install()"}
  use {'junegunn/fzf.vim'}
  use {'scrooloose/nerdcommenter'}
  use {'itchyny/lightline.vim'}
  use {'mhinz/vim-startify'}
  use {'arcticicestudio/nord-vim'}
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
end)
