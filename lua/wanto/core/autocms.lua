vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.handlers["textDocument/signatureHelp"] = function() end
  end,
})
