vim.o.shell = "fish"

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

require("toggleterm").setup({
  size = function()
    return math.min(vim.o.columns * 0.4)
  end,
  open_mapping = [[<C-\>]],
  direction = "vertical",
  shade_terminals = false,
  start_in_insert = false,
})

-- Terminal programs
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  start_in_insert = true,
  on_open = function(term)
    vim.cmd "startinsert!"
  end,
})

local function lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>g",
  "<cmd>lua require('speculative.terminal').lazygit_toggle()<CR>",
  { noremap = true, silent = true }
)

return {
  lazygit_toggle = lazygit_toggle,
}
