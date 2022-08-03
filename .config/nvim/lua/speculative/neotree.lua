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
    },
  },
  window = {
    width = '20%'
  }
})

-- Open by default on wide enough windows
if vim.api.nvim_win_get_width(0) > 100
then
  require('neo-tree.command').execute({
    action = 'show'
  })
end
