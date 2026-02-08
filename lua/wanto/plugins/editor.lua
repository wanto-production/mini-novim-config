return {
  -- ============================================================================
  -- FILE EXPLORER
  -- ============================================================================
  {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    event = "VimEnter",
    config = function()
      require('oil').setup {
        -- Core
        default_file_explorer = true,
        restore_win_view_on_close = true,
        delete_to_trash = vim.fn.has 'macunix' == 1, -- NixOS = false

        -- Columns (NixOS optimized)
        columns = {
          'icon',
          { 'permissions', max_width = 12 },
          { 'size',        max_width = 8 },
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
    end
  },

  -- ============================================================================
  -- TREESITTER
  -- ============================================================================
  {
    'nvim-treesitter/nvim-treesitter',
    branch = "master",
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
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

      vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
        pattern = { '*.component.html', '*.container.html' },
        callback = function()
          vim.treesitter.start(nil, 'angular')
        end,
      })
    end
  },

  -- ============================================================================
  -- TERMINAL
  -- ============================================================================
  {
    'akinsho/toggleterm.nvim',
    cmd = 'ToggleTerm',
    event = 'VeryLazy',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<leader>tt]],
        direction = 'float',     -- floating window
        float_opts = {
          border = 'curved',
          winblend = 0,
        },
        shade_terminals = true,
      }
    end
  },

  -- ============================================================================
  -- MARKDOWN & LATEX
  -- ============================================================================
  {
    'OXY2DEV/markview.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('markview').setup {
        modes = { 'n', 'i', 'c' }, -- Render di normal/insert/command
        signs = true,
        headings = true,
        conceal = true,
      }
    end
  },

  {
    'lervag/vimtex',
    ft = 'tex',
    config = function()
      vim.g.vimtex_view_method = 'zathura'
    end
  },
}
