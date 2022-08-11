-- Cache-less require for reloading
local function configure(module)
  package.loaded[module] = nil
  return require(module)
end

-- Packer init
vim.o.termguicolors = true
configure "speculative.plugins"

-- Colorscheme
-- This comes first because some plugins need further customization
vim.o.background = "dark"
vim.api.nvim_command "colorscheme phoenix"
vim.api.nvim_command "PhoenixPurple"
vim.api.nvim_command "set guicursor+=a:Cursor/lCursor"
vim.o.guifont = "Iosevka"

-- Leader
vim.g.maplocalleader = " "
vim.g.mapleader = " "
vim.o.timeoutlen = 500

-- Plugin configs
configure "speculative.session"
configure "speculative.leap"
configure "speculative.neotree"
configure "speculative.feline"
configure "speculative.bufferline"
configure "speculative.terminal"
configure "speculative.trouble"
configure "speculative.lsp"
configure "speculative.cmp"
configure "speculative.treesitter"
configure "speculative.indent"
configure "speculative.surround"
configure "speculative.whichkey"

-- Hotkeys
-- =======

-- Fundamentals
vim.keymap.set("n", "<leader><esc>", ":luafile $MYVIMRC<cr>")
vim.keymap.set("i", "<C-BS>", "<C-w>")
vim.keymap.set("i", "<C-h>", "<C-w>")

-- Toggle search
vim.keymap.set("n", "<leader>h", function()
  if vim.o.hlsearch then
    vim.o.hlsearch = false
  else
    vim.o.hlsearch = true
  end
end)

-- Alternative Commentary binding
vim.keymap.set({ "n", "v" }, "<C-_>", ":Commentary<cr>")

-- Add empty lines
vim.keymap.set("n", "<M-o>", "o<esc>k")
vim.keymap.set("n", "<M-S-o>", "O<esc>j")

-- BufferLine navigation
vim.keymap.set("n", "<C-q>", function()
  local ft = vim.api.nvim_buf_get_option(0, "ft")
  if ft == "qf" then
    vim.api.nvim_win_close(0, true)
  elseif ft == "neo-tree" or ft == "Trouble" or ft == "packer" or ft == "help" then
    vim.api.nvim_command ":q"
  else
    vim.api.nvim_command ":Bdelete"
  end
end)
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<cr>")
vim.keymap.set("n", "<C-M-h>", ":BufferLineMovePrev<cr>")
vim.keymap.set("n", "<C-M-l>", ":BufferLineMoveNext<cr>")

-- Toggle Trouble
vim.keymap.set("n", "<leader>t", ":TroubleToggle<cr>")

-- Telescope
vim.keymap.set("n", "<C-k>", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>")

-- In some terminals, cursor becomes "invisible" on matching brackets
-- e.g. https://github.com/tyrannicaltoucan/vim-deep-space/issues/10
if os.getenv "TERM" ~= nil then
  vim.api.nvim_command "autocmd VimEnter * silent NoMatchParen"
end

-- vim options
vim.o.mouse = "a"

vim.o.backspace = "indent,eol,start"
vim.o.autoindent = true
vim.o.smarttab = true

vim.o.number = true
vim.o.relativenumber = true
vim.api.nvim_command "windo set number relativenumber"
vim.o.signcolumn = "yes"

vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

vim.o.scrolloff = 1
vim.o.showcmd = true
