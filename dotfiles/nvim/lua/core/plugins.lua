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


  -- system
  use {
    'VonHeikemen/fine-cmdline.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'}
    }
  }
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use {
      'stevearc/oil.nvim',
      config = function() require('oil').setup() end
    }
    -- appearance
    use 'nvim-tree/nvim-web-devicons'

    -- search
    use({
  	  'nvim-telescope/telescope.nvim',
  	  branch = '0.1.x',
  	  requires = { {'nvim-lua/plenary.nvim'} }
    })
    -- shell
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end}

  -- editor
  use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function ()
          require("autoclose").setup()
        end,
    }
  use 'nvim-treesitter/nvim-treesitter'
  use 'm4xshen/autoclose.nvim'
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  -- note-taking
  use {
      "nvim-neorg/neorg",
      config = function()
          require('neorg').setup {
              load = {
                  ["core.defaults"] = {}, -- Loads default behaviour
                  ["core.dirman"] = { -- Manages Neorg workspaces
                      config = {
                          workspaces = {
                              notes = "~/notes",
                          },
                          default_workspace = "notes",
                      },
                  },
              },
          }
      vim.opt.conceallevel = 2 
      end,
      run = ":Neorg sync-parsers",
      requires = "nvim-lua/plenary.nvim",
  }
    -- appearance
    use 'overcache/NeoSolarized'
    use 'nvim-lualine/lualine.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'godlygeek/tabular'
    use 'nvim-lua/popup.nvim'

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
    -- ai
    use({
      "jackMort/ChatGPT.nvim",
        config = function()
          require("chatgpt").setup()
        end,
        requires = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
        }
    })
    -- API Client
    use {
      "rest-nvim/rest.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("rest-nvim").setup({
          -- Open request results in a horizontal split
          result_split_horizontal = false,
          -- Keep the http file buffer above|left when split horizontal|vertical
          result_split_in_place = false,
          -- Skip SSL verification, useful for unknown certificates
          skip_ssl_verification = false,
          -- Encode URL before making request
          encode_url = true,
          -- Highlight request on run
          highlight = {
            enabled = true,
            timeout = 150,
          },
          result = {
            -- toggle showing URL, HTTP info, headers at top the of result window
            show_url = true,
            -- show the generated curl command in case you want to launch
            -- the same request via the terminal (can be verbose)
            show_curl_command = false,
            show_http_info = true,
            show_headers = true,
            -- executables or functions for formatting response body [optional]
            -- set them to false if you want to disable them
            formatters = {
              json = "jq",
              html = function(body)
                return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
              end
            },
          },
          -- Jump to request line on run
          jump_to_request = false,
          env_file = '.env',
          custom_dynamic_variables = {},
          yank_dry_run = true,
        })
      end
    }

--
  if packer_bootstrap then
    require('packer').sync()
  end
end)
