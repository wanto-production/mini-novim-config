return {
  -- ============================================================================
  -- LSP
  -- ============================================================================
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason-org/mason.nvim',
    },
    config = function()
      -- LSP config here
    end
  },

  {
    'mason-org/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    config = function()
      require('mason').setup({
        ui = {
          border = 'rounded',
        }
      })
    end
  },

  -- ============================================================================
  -- COMPLETION
  -- ============================================================================
  {
    'Saghen/blink.cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
    },
    version = '*',
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      vim.lsp.config('*', { capabilities = capabilities })
      require('blink.cmp').setup {
        keymap = { ['<CR>'] = { 'accept', 'fallback' } },
        appearance = { nerd_font_variant = 'mono' },
        completion = {
          documentation = { auto_show = true, window = { border = 'single' } },
          menu = { border = 'single' },
        },
        sources = { default = { 'lsp', 'path' } },
        fuzzy = { implementation = 'lua' },
        signature = { enabled = true },
      }
    end
  },

  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    build = 'make install_jsregexp',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end
  },

  -- ============================================================================
  -- FORMATTING
  -- ============================================================================
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    config = function()
      require("conform").setup({
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end
  },
}
