require('bufferline').setup{
  options = {
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    },
    separator_style = 'slant',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end
  }
}

