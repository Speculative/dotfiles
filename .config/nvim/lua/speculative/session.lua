-- Neotree gets saved weirdly in sessions and doesn't restore
-- But I always re-open neotree on large enough terminals anyway
local function close_neo_tree()
  local manager = require "neo-tree.sources.manager"
  manager.close_all()
end

require("auto-session").setup({
  bypass_session_save_file_types = { "neo-tree", "Trouble", "help", "packer", "qf" },
  pre_save_cmds = { close_neo_tree },
  post_restore_cmds = {
    -- For some reason, if neotree opens while session restore is happening,
    -- there's an error, so wait until session restore finishes before opening
    require("speculative.neotree").open_neotree_on_wide,
  },
})

require("session-lens").setup({
  theme_conf = { winblend = 0 },
})

require("telescope").load_extension "session-lens"

vim.keymap.set("n", "<leader>fs", ":SearchSession<cr>")
