--[[
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local format_on_save = function(client, bufnr)
  -- Format on save
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- Change this in neovim 0.8
        client.request("textDocument/formatting", vim.lsp.util.make_formatting_params(), nil, bufnr)
        -- vim.lsp.buf.formatting_sync()
      end,
    }) end
end
--]]
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lsp_signature").setup()

local format_on_save = require("lsp-format").on_attach

local language_hotkeys = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

local everything = function(client, bufnr)
  format_on_save(client)
  language_hotkeys(client, bufnr)
end

local null_ls = require "null-ls"
null_ls.setup({
  on_attach = format_on_save,
  capabilities = capabilities,
  sources = {
    -- Web
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "html", "json", "yaml", "markdown" },
    }),

    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,

    -- Lua
    null_ls.builtins.formatting.stylua,
  },
})

local lspconfig = require "lspconfig"
lspconfig.pyright.setup({
  on_attach = language_hotkeys,
  capabilities = capabilities,
})
lspconfig.tsserver.setup({
  on_attach = language_hotkeys,
  capabilities = capabilities,
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
})
lspconfig.html.setup({
  on_attach = language_hotkeys,
  capabilities = capabilities,
})
lspconfig.cssls.setup({
  on_attach = language_hotkeys,
  capabilities = capabilities,
})
lspconfig.jsonls.setup({
  on_attach = language_hotkeys,
  capabilities = capabilities,
})
lspconfig.gopls.setup({
  on_attach = everything,
  capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
  on_attach = everything,
  capabilities = capabilities,
})
lspconfig.hls.setup({
  on_attach = everything,
  capabilities = capabilities,
})
lspconfig.dockerls.setup({
  on_attach = everything,
  capabilities = capabilities,
  filetypes = { "dockerfile", "Dockerfile" },
})
lspconfig.jdtls.setup({
  on_attach = everything,
  capabilities = capabilities,
})
lspconfig.hls.setup({
  on_attach = everything,
  capabilities = capabilities,
  settings = {
    haskell = {
      formattingProvider = "ormolu",
    },
  },
})
lspconfig.svelte.setup({
  on_attach = everything,
  capabilities = capabilities,
})
lspconfig.lua_ls.setup({
  on_attach = language_hotkeys,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Don't update LSP diagnostics while still in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    -- delay update diagnostics
    update_in_insert = false,
  })
-- Add border to hover tooltips
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
