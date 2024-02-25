local lspconfig = require('lspconfig')
local cmp = require('cmp')

-- Configure pyright LSP server
lspconfig.pyright.setup{}

-- Configure nvim-cmp
cmp.setup({
  sources = {
    { name = 'nvim_lsp' }, -- Enable LSP suggestions
    { name = 'buffer' },
    { name = 'path' },
    { name = 'tags' },
    { name = 'luasnip' },
    { name = 'treesitter' }
    -- You can add more completion sources here if needed
  },
})


-- vim.lsp.set_log_level("debug")
-- 
-- Define on_attach function before using it
local on_attach = function(client, bufnr)
  if client.name == 'ruff_lsp' then
    client.server_capabilities.hoverProvider = false
  end
end
-- 
-- -- Set up capabilities
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- 
-- LSP server setups
require'lspconfig'.pyright.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      },
      pythonPath = '/opt/local/bin/python', -- Adjust this path
    }
  }
}

require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    settings = {
      args = {},
    }
  }
}
-- 
-- -- Global key mappings
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
-- 
-- -- Autocommand for buffer-local key mappings
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
--   end,
-- })
