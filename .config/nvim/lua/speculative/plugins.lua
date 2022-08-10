vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer
  use "wbthomason/packer.nvim"

  -- Editing fundamentals
  -- use "tpope/vim-surround"
  use "tpope/vim-sleuth"
  use "jiangmiao/auto-pairs"
  use "tpope/vim-commentary"
  use "unblevable/quick-scope"
  use "ggandor/leap.nvim"
  use "junegunn/vim-slash"
  use "lukas-reineke/indent-blankline.nvim"
  use "kylechui/nvim-surround"
  use "echasnovski/mini.nvim"

  -- IDE Features
  use "tpope/vim-fugitive"
  use "neovim/nvim-lspconfig"
  use "ray-x/lsp_signature.nvim"
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  })
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })
  -- use 'sidebar-nvim/sidebar.nvim'
  -- require('sidebar-nvim').setup({
  --   open = true,
  --   sections = { "files", "git", "diagnostics" }
  -- })
  use "folke/which-key.nvim"
  use "RRethy/vim-illuminate"
  use "lukas-reineke/lsp-format.nvim"
  use "L3MON4D3/LuaSnip"
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",
    },
  })
  use "rafamadriz/friendly-snippets"
  use "akinsho/toggleterm.nvim"

  -- Interface
  use "widatama/vim-phoenix"
  -- use({
  --   "xiyaowong/nvim-transparent",
  --   config = require("transparent").setup({
  --     enable = true,
  --   }),
  -- })
  use({
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use "feline-nvim/feline.nvim"
  use "moll/vim-bbye"
end)
