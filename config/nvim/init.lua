local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  use {'wincent/loupe'}
  use {'scrooloose/nerdcommenter'}
  use {'itchyny/lightline.vim'}
  use {'mhinz/vim-startify'}
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'ggandor/leap.nvim'}
  use {'shaunsingh/nord.nvim'}
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {{'nvim-lua/plenary.nvim'}}}
  use {'fannheyward/telescope-coc.nvim'}
  use {"ellisonleao/glow.nvim"}
  --use {'nvim-treesitter/nvim-treesitter',
    --run = function()
            --local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            --ts_update()
      --end,
  --}
  --use {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('settings')
-- require('treesitter')
require('maps')
