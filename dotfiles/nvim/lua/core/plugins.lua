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

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'


  -- filesystem
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
    -- appearance
    use 'nvim-tree/nvim-web-devicons'

    -- search
    use({
  	  'nvim-telescope/telescope.nvim',
  	  tag = '0.1.0',
  	  requires = { {'nvim-lua/plenary.nvim'} }
    })

  -- editor
  use 'tpope/vim-surround'
  use 'nvim-treesitter/nvim-treesitter'
    -- appearance
    use 'overcache/NeoSolarized'
    use 'nvim-lualine/lualine.nvim'
    use 'lewis6991/gitsigns.nvim'
    -- use { "catppuccin/nvim", as = "catppuccin" }

    -- intellisense
    use 'neoclide/coc.nvim' 
  
  -- productivity
    -- cheatsheets
    use {
          'sudormrfbin/cheatsheet.nvim',
        
          requires = {
            {'nvim-telescope/telescope.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
          }
        }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
