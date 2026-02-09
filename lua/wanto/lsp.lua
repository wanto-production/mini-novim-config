vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { focusable = false }
)

vim.lsp.enable { 'lua_ls', 'svelte', 'vtsls', 'tailwindcss', 'nixd', 'marksman' }
