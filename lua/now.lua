require('which-key').setup {
  win = { border = 'single' },
  layout = { padding = 2 },
}

require('mini.icons').mock_nvim_web_devicons()
require('mini.pairs').setup()

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'regex',
    'bash',
    'vue',
    'angular',
    'scss',
    'typescript',
    'javascript',
    'astro',
    'svelte',
    'css',
    'html',
    'bash',
    'c',
    'c_sharp',
    'diff',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'query',
    'vim',
    'vimdoc',
    'rust',
    'ron',
    'regex',
    'php',
    'latex',
    'html',
    'norg',
    'typst',
    'nix',
    'markdown',
    'markdown_inline',
    'latex',
    'yaml',
    'tsx',
    'norg',
  },
  sync_install = false,
  ignore_install = {},
  modules = {},
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
}

require('oil').setup {
  -- Core
  default_file_explorer = true,
  restore_win_view_on_close = true,
  delete_to_trash = vim.fn.has 'macunix' == 1, -- NixOS = false

  -- Columns (NixOS optimized)
  columns = {
    'icon',
    { 'permissions', max_width = 12 },
    { 'size', max_width = 8 },
    'mtime',
  },

  -- Buffer settings (performance)
  buf_options = {
    buflisted = false,
    bufhidden = 'hide',
    filetype = 'oil',
  },

  -- Window settings (minimalist)
  win_options = {
    wrap = false,
    signcolumn = 'no',
    cursorcolumn = false,
    foldcolumn = '0',
    spell = false,
    list = false,
  },

  -- View config (git integration)
  view_options = {
    show_hidden = true, -- .git, .nix → visible
  },

  -- Keymaps tambahan (poweruser)
  keymaps = {
    ['g?'] = 'actions.show_help',
    ['<CR>'] = 'actions.select',
    ['<C-s>'] = 'actions.select_vsplit',
    ['-'] = 'actions.preview',
    ['<BS>'] = 'actions.parent',
    ['.'] = 'actions.toggle_hidden',
  },
  git = {
    -- Return true to automatically git add/mv/rm files
    add = function(path)
      return false
    end,
    mv = function(src_path, dest_path)
      return false
    end,
    rm = function(path)
      return false
    end,
  },
  -- Floating window (optional, Ctrl+E)
  float = {
    max_width = 0.9,
    max_height = 0.9,
    border = 'rounded',
    win_options = { winblend = 10 },
  },
}

require('bufferline').setup {
  -- Catppuccin integration
  highlights = require('catppuccin.special.bufferline').get_theme(),

  options = {
    -- OIL PERFORMANCE FIX (no diagnostics lag)
    diagnostics = 'nvim_lsp',

    -- Icons via mini.icons
    get_element_icon = function(element)
      if element.filetype ~= '' then
        local icon, hl = require('mini.icons').get('filetype', element.filetype)
        return icon, hl
      elseif element.path ~= '' then
        local icon, hl = require('mini.icons').get('file', element.path)
        return icon, hl
      end
      return '', ''
    end,

    mode = 'buffers',
    numbers = 'ordinal',
    show_buffer_icons = true,
    show_close_icon = false,
    show_buffer_close_icons = false,
    always_show_bufferline = true,

    -- OIL OFFSET (highlight + text)
    offsets = {
      {
        filetype = 'oil',
        text = '📁 FILES',
        highlight = 'Directory',
        text_align = 'center',
        separator = true,
      },
    },
  },
}

require('catppuccin').setup {
  flavour = 'mocha',
  transparent_background = false,
  dim_inactive = {
    enabled = true,
    shade = 'dark',
    percentage = 0.10,
  },
  styles = {
    comments = { 'italic' },
    keywords = { 'italic' },
  },
  color_overrides = {
    mocha = {
      base = '#11151c', -- blue-black base
      mantle = '#0e1117', -- dark blue-black
      crust = '#0a0d12', -- darkest
      text = '#c9d1d9',
      subtext1 = '#b1bac4',
      subtext0 = '#8b949e',
      surface0 = '#1a1f26',
      surface1 = '#252a32',
      surface2 = '#30353d',
    },
  },
  integrations = {
    -- snacks (kalau ada), fallback aman
    treesitter = true,
    native_lsp = true,
    lsp_trouble = true,
    mason = true,
    telescope = true,
    dap = { enabled = true, enable_ui = true },
  },
}
vim.cmd.colorscheme 'catppuccin-mocha'
