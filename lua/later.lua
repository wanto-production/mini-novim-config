local function lsp_names()
  local clients = vim.lsp.get_clients { bufnr = 0 }
  if not clients or vim.tbl_isempty(clients) then
    return 'None'
  end
  local names = {}
  for _, client in pairs(clients) do
    table.insert(names, client.name)
  end
  return table.concat(names, ', ')
end

require('lualine').setup {
  options = {
    theme = 'auto', -- Ganti catppuccin kalau belum ada
    globalstatus = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { statusline = { 'NvimTree', 'alpha' } },
    refresh = { statusline = 1000 },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str:sub(1, 1)
        end,
      },
    },
    lualine_b = {
      'branch',
      {
        source = function()
          -- Try mini.diff first
          local has_mini_diff = pcall(require, 'mini.diff')
          if has_mini_diff then
            local summary = vim.b.minidiff_summary
            if summary then
              return {
                added = summary.add,
                modified = summary.change,
                removed = summary.delete,
              }
            end
          end

          -- Fallback to gitsigns
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end

          return nil
        end,
      },
    },
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 0,
        symbols = { modified = ' [+]', readonly = ' RO' },
      },
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },
      },
      'branch',
      'diff',
    },
    lualine_x = {
      lsp_names,
      'encoding',
      { 'fileformat', symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' } },
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
}

require('markview').setup {
  modes = { 'n', 'i', 'c' }, -- Render di normal/insert/command
  signs = true,
  headings = true,
  conceal = true,
}

require('cord').setup {
  editor = {
    client = 'neovim',
    tooltip = 'ngoding dulu le',
  },
  display = {
    theme = 'catppuccin',
    flavor = 'dark',
  },
  buttons = {
    {
      label = 'View My Github',
      url = 'https://github.com/wanto-production',
    },
    {
      label = 'View My Portofolio',
      url = 'https://portofolio-wanto.vercel.app',
    },
  },
}

require('toggleterm').setup {
  open_mapping = [[<leader>tt]], -- Ctrl+\ toggle
  direction = 'float', -- floating window
  float_opts = {
    border = 'curved',
    winblend = 0,
  },
  shade_terminals = true,
}

require('noice').setup {
  lsp = {
    progress = { enabled = true},
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  notify = { enabled = false },
  cmdline = {
    enabled = true,
    view = 'cmdline_popup',
  },
  views = {
    cmdline_popup = {
      border = { style = 'rounded' },
      position = { row = '10%', col = '50%' },
      size = { width = 60, height = 'auto' },
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
  },
}

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

require("conform").setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

require('mini.diff').setup {
  -- View settings (equivalent to signs)
  view = {
    style = 'sign', -- 'sign' | 'number' | 'none'
    signs = {
      add = '┃',
      change = '┃',
      delete = '_',
    },
    priority = 6, -- sign_priority
  },

  -- Source settings
  source = nil, -- Default auto-detect git

  -- Delay for update (equivalent to update_debounce)
  delay = {
    text_change = 100, -- update_debounce
  },

  -- Mappings
  mappings = {
    -- Apply hunks
    apply = 'gh',
    reset = 'gH',

    -- Hunk text object
    textobject = 'gh',

    -- Navigate hunks
    goto_first = '[H',
    goto_prev = '[h',
    goto_next = ']h',
    goto_last = ']H',
  },

  -- Options
  options = {
    algorithm = 'histogram', -- 'myers' | 'minimal' | 'patience' | 'histogram'
    indent_heuristic = true,
    linematch = 60, -- Performance optimization
    wrap_goto = false,
  },
}
