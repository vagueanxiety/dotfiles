return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  use {'wincent/loupe'}
  use {'scrooloose/nerdcommenter'}
  use {'itchyny/lightline.vim'}
  use {'mhinz/vim-startify'}
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
  use {'ggandor/leap.nvim'}
  use {'shaunsingh/nord.nvim'}
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {{'nvim-lua/plenary.nvim'}}}
  use {'fannheyward/telescope-coc.nvim'}
  use {"ellisonleao/glow.nvim"}
end)
