-- Cache-less require for reloading
local function configure(module)
  package.loaded[module] = nil
  return require(module)
end

-- Packer init
vim.o.termguicolors = true
configure('speculative.plugins')

-- Plugin configs
configure('speculative.lsp')
configure('speculative.neotree')
configure('speculative.bufferline')
configure('speculative.treesitter')
configure('speculative.null-ls')

-- Hotkeys
-- =======

-- Fundamentals
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader><esc>', ':luafile $MYVIMRC<cr>')

-- Toggle search
vim.keymap.set('n', '<leader>h', function()
  if vim.o.hlsearch then
    vim.o.hlsearch = false
  else
    vim.o.hlsearch = true
  end
end)

-- Add empty lines
vim.keymap.set('n', '<m-o>', 'o<esc>k')
vim.keymap.set('n', '<m-s-o>', 'O<esc>j')

-- BufferLine navigation
vim.keymap.set('n', '<c-q>', function()
  if vim.api.nvim_buf_get_option(0, 'ft') == 'qf' then
    vim.api.nvim_win_close(0, true)
  else
    vim.api.nvim_command(':Bdelete')
  end
end)
vim.keymap.set('n', '<c-h>', ':BufferLineCyclePrev<cr>')
vim.keymap.set('n', '<c-l>', ':BufferLineCycleNext<cr>')
vim.keymap.set('n', '<c-m-h>', ':BufferLineMovePrev<cr>')
vim.keymap.set('n', '<c-m-l>', ':BufferLineMoveNext<cr>')

-- Toggle NeoTree
vim.keymap.set('n', '\\', ':Neotree<cr>')
vim.keymap.set('n', '|', ':Neotree toggle<cr>')

-- Toggle Trouble
vim.keymap.set('n', '<leader>t', ':TroubleToggle<cr>')

-- Telescope
vim.keymap.set('n', '<c-k>', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>')

-- Colorscheme
vim.o.background = 'dark'
vim.api.nvim_command 'colorscheme phoenix'
vim.api.nvim_command 'PhoenixPurple'
-- In some terminals, cursor becomes "invisible" on matching brackets
-- e.g. https://github.com/tyrannicaltoucan/vim-deep-space/issues/10
if os.getenv('TERM') ~= nil then
  vim.api.nvim_command 'autocmd VimEnter silent! NoMatchParen'
end


-- vim options
vim.o.mouse = 'a'

vim.o.backspace = 'indent,eol,start'
vim.o.autoindent = true
vim.o.smarttab = true

vim.o.number = true
vim.o.relativenumber = true
vim.api.nvim_command 'windo set number relativenumber'

vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

vim.o.scrolloff = 1
vim.o.showcmd = true
