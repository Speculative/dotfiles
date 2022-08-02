-- Packer init
vim.o.termguicolors = true
require('plugins')

-- Plugin configs
require('lsp')

-- Hotkeys
-- =======

-- Fundamentals
vim.g.mapleader = ' '
vim.o.timeoutlen=500
vim.keymap.set('n', '<leader><esc>', ':luafile $MYVIMRC<cr>')

-- Toggle search
vim.keymap.set('n', '<leader>h', function()
  if vim.o.hlsearch then
    vim.o.hlsearch = false
  else
    vim.o.hlsearch = true
  end
end)

-- Toggle NeoTree
vim.keymap.set('n', '<F2>', ':NeoTreeRevealToggle<cr>')

-- Colorscheme
vim.g.monotone_h = 200
vim.g.monotone_s = 10
vim.g.monotone_l = 60
vim.g.monotone_contrast = 110
vim.g.monotone_true_monotone = true
vim.o.background = 'dark'
vim.api.nvim_command 'colorscheme monotone'

-- vim options
vim.o.mouse = 'a'
vim.o.backspace = 'indent,eol,start'
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.number = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.scrolloff = 1
vim.o.showcmd = true
