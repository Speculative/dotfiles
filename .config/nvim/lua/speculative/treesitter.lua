  require('nvim-treesitter.configs').setup{
    highlight = {
      enable = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gs",
        node_incremental = "gsl",
        node_decremental = "gsh",
        scope_incremental = "gsk",
      },
    },
    indent = {
      enable = true
    }
  }
