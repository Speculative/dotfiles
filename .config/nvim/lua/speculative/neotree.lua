vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

local last_window = vim.fn.win_getid()

vim.keymap.set("n", "<leader>bf", ":Neotree source=filesystem<cr>")
vim.keymap.set("n", "<leader>bg", ":Neotree source=git_status<cr>")
vim.keymap.set("n", "<leader>bb", ":Neotree source=buffers<cr>")
vim.keymap.set("n", "\\", ":Neotree focus<cr>")
vim.keymap.set("n", "|", ":Neotree toggle<cr>")

require("neo-tree").setup({
  close_if_last_window = true,
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    name = {
      use_git_status_colors = true,
    },
  },
  window = {
    width = math.min(math.floor(vim.o.columns * 0.2), 30),
    mappings = {
      ["\\"] = function()
        vim.api.nvim_set_current_win(last_window)
      end,
      ["h"] = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" and node:is_expanded() then
          require("neo-tree.sources.filesystem").toggle_directory(state, node)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      ["l"] = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" then
          if not node:is_expanded() then
            require("neo-tree.sources.filesystem").toggle_directory(state, node)
          elseif node:has_children() then
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        end
      end,
    },
  },
  filesystem = {
    follow_current_file = true,
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        -- This effectively hides the cursor
        vim.api.nvim_command "highlight! Cursor blend=100"
      end,
    },
    {
      event = "neo_tree_buffer_leave",
      handler = function()
        -- Make this whatever your current Cursor highlight group is.
        vim.api.nvim_command "highlight! Cursor guibg=#EFEFEF blend=0"
      end,
    },
  },
})

local function open_neotree_on_wide()
  -- Open by default on wide enough windows
  if vim.api.nvim_win_get_width(0) > 100 then
    require("neo-tree.command").execute({
      action = "show",
    })
  end
end

return {
  open_neotree_on_wide = open_neotree_on_wide,
}
