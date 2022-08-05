local vi_mode_utils = require "feline.providers.vi_mode"

-- Purple Prime                #B294BB
-- Purple Secondary            #A582A3
-- Purple Tertiary             #D1AFDD
local accent = "#B294BB"

local statusline = {
  components = {
    active = {},
    inactive = {},
  },
  force_inactive = {
    filetypes = {
      "^NvimTree$",
      "^packer$",
      "^fugitive$",
      "^fugitiveblame$",
      "^qf$",
      "^help$",
      "^neo%-tree$",
    },
    buftypes = {
      "^terminal$",
    },
    bufnames = {
      "^neo-tree filesystem.*$",
    },
  },
  disable = {
    filetypes = {
      "^SidebarNvim$",
    },
  },
}

statusline.components.active[1] = {
  {
    provider = "▊ ",
    hl = {
      fg = accent,
    },
  },
  {
    provider = "vi_mode",
    icon = "",
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = vi_mode_utils.get_mode_color(),
        style = "bold",
      }
    end,
  },
  {
    provider = {
      name = "file_info",
      opts = {
        colored_icon = false,
      },
    },
    hl = {
      fg = "white",
      bg = accent,
      style = "bold",
    },
    left_sep = {
      "slant_left_2",
      { str = " ", hl = { bg = accent, fg = "NONE" } },
    },
    right_sep = {
      { str = " ", hl = { bg = accent, fg = "NONE" } },
      "slant_right_2",
      " ",
    },
  },
  {
    provider = "file_size",
    right_sep = {
      " ",
      {
        str = "slant_left_2_thin",
        hl = {
          fg = "fg",
          bg = "bg",
        },
      },
    },
  },
  {
    provider = "position",
    left_sep = " ",
    right_sep = {
      " ",
      {
        str = "slant_right_2_thin",
        hl = {
          fg = "fg",
          bg = "bg",
        },
      },
    },
  },
  {
    provider = "diagnostic_errors",
    hl = { fg = "red" },
  },
  {
    provider = "diagnostic_warnings",
    hl = { fg = "yellow" },
  },
  {
    provider = "diagnostic_hints",
    hl = { fg = "cyan" },
  },
  {
    provider = "diagnostic_info",
    hl = { fg = "skyblue" },
  },
}

statusline.components.active[2] = {
  {
    provider = "git_branch",
    hl = {
      fg = "white",
      bg = "black",
      style = "bold",
    },
    right_sep = {
      str = " ",
      hl = {
        fg = "NONE",
        bg = "black",
      },
    },
  },
  {
    provider = "git_diff_added",
    hl = {
      fg = "green",
      bg = "black",
    },
  },
  {
    provider = "git_diff_changed",
    hl = {
      fg = "orange",
      bg = "black",
    },
  },
  {
    provider = "git_diff_removed",
    hl = {
      fg = "red",
      bg = "black",
    },
    right_sep = {
      str = " ",
      hl = {
        fg = "NONE",
        bg = "black",
      },
    },
  },
  {
    provider = "line_percentage",
    hl = {
      style = "bold",
    },
    left_sep = "  ",
    right_sep = " ",
  },
  {
    provider = "scroll_bar",
    hl = {
      fg = accent,
      style = "bold",
    },
  },
}

statusline.components.inactive[1] = {
  {
    provider = "file_type",
    hl = {
      fg = "white",
      bg = accent,
      style = "bold",
    },
    left_sep = {
      str = " ",
      hl = {
        fg = "NONE",
        bg = accent,
      },
    },
    right_sep = {
      {
        str = " ",
        hl = {
          fg = "NONE",
          bg = accent,
        },
      },
      "slant_right",
    },
  },
  -- Empty component to fix the highlight till the end of the statusline
  {},
}

require("feline").setup(statusline)
