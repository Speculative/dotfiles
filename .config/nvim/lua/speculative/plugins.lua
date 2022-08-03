vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Editing fundamentals
  use 'tpope/vim-surround'
  use 'tpope/vim-sleuth'
  use 'justinmk/vim-sneak'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-commentary'

  -- IDE Features
  use 'tpope/vim-fugitive' use 'neovim/nvim-lspconfig'
  use 'lewis6991/gitsigns.nvim'
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use 'mg979/vim-visual-multi'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {{'nvim-lua/plenary.nvim'}}
  }
  --[[
  use {
    'AckslD/nvim-whichkey-setup.lua',
    requires = {'liuchengxu/vim-which-key'},
  }
  --]]

  -- Interface
  use 'widatama/vim-phoenix'
  use 'xiyaowong/nvim-transparent'
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use 'feline-nvim/feline.nvim'
  use 'moll/vim-bbye'

  -- Plugin configurations
  require('feline').setup()

  require("transparent").setup({
    enable = true,
  })

end)

