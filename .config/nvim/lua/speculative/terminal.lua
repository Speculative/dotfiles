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

local term_window = nil
local term_state = "closed"
local initial_window = vim.fn.win_getid()

local function debug()
  print("term_window: ", term_window, " initial_window: ", initial_window, " state: ", term_state)
end

local function toggle_term_focus()
  local ft = vim.api.nvim_buf_get_option(0, "ft")

  if term_state == "closed" then
    require("toggleterm").toggle(1)
    term_state = "open"
  elseif ft ~= "toggleterm" and term_window ~= nil then
    vim.api.nvim_set_current_win(term_window)
  elseif ft == "toggleterm" and initial_window ~= nil then
    vim.api.nvim_set_current_win(initial_window)
  end
end

local function toggle_term_state()
  if term_state == "closed" then
    require("toggleterm").toggle(1)
    term_state = "open"
  elseif term_state == "open" and term_window ~= nil then
    vim.api.nvim_win_set_width(term_window, math.floor(vim.o.columns * 0.8))
    term_state = "expanded"
  else
    vim.api.nvim_win_set_width(term_window, math.floor(vim.o.columns * 0.4))
    require("toggleterm").toggle(1)
    term_state = "closed"
  end
end

local function close_term()
  if term_state ~= "closed" then
    require("toggleterm").toggle(1)
    term_state = "closed"
  end
end

vim.keymap.set(
  "n",
  [[<C-\>]],
  ':lua require("speculative.terminal").toggle_term_focus()<CR>',
  { silent = true }
)

vim.keymap.set(
  "n",
  [[<C-M-\>]],
  ':lua require("speculative.terminal").toggle_term_state()<CR>',
  { silent = true }
)

require("toggleterm").setup({
  size = function()
    return math.floor(vim.o.columns * 0.4)
  end,
  -- open_mapping = [[<C-\>]],
  on_open = function(terminal)
    term_window = terminal.window
  end,
  close_on_exit = true,
  direction = "vertical",
  shade_terminals = false,
  start_in_insert = true,
})

-- Terminal programs
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  start_in_insert = true,
  on_open = function(terminal)
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
  toggle_term_state = toggle_term_state,
  toggle_term_focus = toggle_term_focus,
  close_term = close_term,
  lazygit_toggle = lazygit_toggle,
  debug = debug,
}
