vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Editing fundamentals
  use 'tpope/vim-surround'
  use 'tpope/vim-sleuth'
  use 'justinmk/vim-sneak'
  
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

  -- Interface
  use {'Lokaltog/monotone.nvim', requires = 'rktjmp/lush.nvim'}
  use 'xiyaowong/nvim-transparent'
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use 'feline-nvim/feline.nvim'

  -- Plugin configurations
  require('bufferline').setup{
    options = {
      diagnostics = 'nvim_lsp'
    }
  }

  require('feline').setup()

  require("transparent").setup({
    enable = true,
  })

  -- NeoTree config
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  vim.fn.sign_define("DiagnosticSignError",
    {text = " ", texthl = "DiagnosticSignError"})
  vim.fn.sign_define("DiagnosticSignWarn",
    {text = " ", texthl = "DiagnosticSignWarn"})
  vim.fn.sign_define("DiagnosticSignInfo",
    {text = " ", texthl = "DiagnosticSignInfo"})
  vim.fn.sign_define("DiagnosticSignHint",
    {text = "", texthl = "DiagnosticSignHint"})
  require('neo-tree').setup({
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      name = {
        use_git_status_colors = true
      }
    }
  })

end)

