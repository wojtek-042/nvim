local lsp = require("lsp-zero")

-- Set up LSP with recommended settings
lsp.preset("recommended")

-- Ensure specified LSP servers are installed
lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'eslint',
  'clangd'
})

-- Configure LSP for lua-language-server to recognize 'vim' as a global
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- Set up nvim-cmp for LSP
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- Remove conflicting mappings from nvim-cmp
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- Set up nvim-cmp for LSP
lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- Set preferences for LSP
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})
-- Set up keymaps for LSP
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- Go to definition of symbol under cursor
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

  -- Show hover information about symbol under cursor
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

  -- Show list of all symbols in workspace
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)

  -- Show diagnostics in a float window
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

  -- Jump to next diagnostic
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)

  -- Jump to previous diagnostic
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

  -- Show code actions for symbol under cursor
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

  -- Show references to symbol under cursor
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)

  -- Rename symbol under cursor
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

  -- Show signature help for function call
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Set up LSP
lsp.setup()

-- Set virtual text for diagnostics
vim.diagnostic.config({
    virtual_text = true
})
