vim.cmd [[set mouse=]]
vim.cmd [[set noswapfile]]

local severity = vim.diagnostic.severity
vim.diagnostic.config {
  virtual_text = true,
  underline = false,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [severity.ERROR] = ' ',
      [severity.WARN] = ' ',
      [severity.HINT] = '󰠠 ',
      [severity.INFO] = ' ',
    },
  },
}

-- Settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
-- VimTeX global settings
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_forward_search_on_start = false
vim.g.vimtex_compiler_latexmk = {
  aux_dir = '/home/wanto/.textfiles/',
  out_dir = '/home/wanto/.textfiles/',
}
vim.g.vimtex_quickfix_open_on_warning = 0 -- No spam

vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 5
vim.opt.laststatus = 3
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.o.cmdheight = 0
vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.schedule(function()
  vim.notify = require('mini.notify').make_notify()
end)

-- Plugins (FIXED koma)
local path_package = vim.fn.stdpath 'data' .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd 'echo "Installing `mini.nvim`" | redraw'
  local clone_cmd = {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/nvim-mini/mini.nvim',
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd 'packadd mini.nvim | helptags ALL'
  vim.cmd 'echo "Installed `mini.nvim`" | redraw'
end

require('mini.deps').setup()
local add = require('mini.deps').add

add 'stevearc/oil.nvim'
add {
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'master',
  monitor = 'main',
  hooks = {
    post_checkout = function()
      vim.cmd 'TSUpdate'
    end,
  },
}
add 'nvim-telescope/telescope.nvim'
add 'nvim-telescope/telescope-ui-select.nvim'
add 'nvim-lua/plenary.nvim'
add 'neovim/nvim-lspconfig'
add 'mason-org/mason.nvim'
add 'L3MON4D3/LuaSnip'
add 'mfussenegger/nvim-dap'
add 'Saghen/blink.cmp'
add 'nvim-lualine/lualine.nvim'
add 'catppuccin/nvim'
add 'folke/noice.nvim'
add 'MunifTanjim/nui.nvim'
add 'stevearc/conform.nvim'
add 'folke/which-key.nvim'
add 'akinsho/toggleterm.nvim'
add 'akinsho/bufferline.nvim'
add 'OXY2DEV/markview.nvim'
add 'lervag/vimtex'
add 'vyfor/cord.nvim'

require('mini.deps').now(function()
  require 'now'
end)
require('mini.deps').later(function()
  require 'later'
end)

vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
  pattern = { '*.component.html', '*.container.html' },
  callback = function()
    vim.treesitter.start(nil, 'angular')
  end,
})

-- keymaps
local builtIn = require 'telescope.builtin'
local map = vim.keymap.set

map({ 'n' }, '<leader>sf', builtIn.find_files, { desc = '[F] files' })
map({ 'n' }, '<leader>sd', builtIn.diagnostics, { desc = '[F] diagnostic' })

-- Terminal
map('t', '<Esc><Esc>', '<C-\\\\><C-n>', { desc = 'Exit terminal mode' })

-- Insert
map('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', { desc = 'Move line up', silent = true })
map('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', { desc = 'Move line down', silent = true })

-- Visual
map('v', '<A-Down>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down', silent = true })
map('v', '<A-Up>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up', silent = true })

-- Normal
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus left' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus right' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus down' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus up' })
map('n', '<A-Up>', ':m .-2<CR>==', { desc = 'Move line up', silent = true })
map('n', '<A-Down>', ':m .+1<CR>==', { desc = 'Move line down', silent = true })
map('n', 'D', '"_D')
map('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Mini [E]xplorer' }) -- UPDATE
map('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Buffer [D]elete' })
map('n', '<leader>bD', '<cmd>bdelete!<CR>', { desc = 'Buffer [D]elete!' })
map('n', '[b', '<cmd>bprevious<CR>', { desc = 'Prev Buffer' }) -- UPDATE (no BufferLine)
map('n', ']b', '<cmd>bnext<CR>', { desc = 'Next Buffer' }) -- UPDATE (no BufferLine)
map('n', '<leader>r', function()
  require('conform').format { async = true, lsp_fallback = true }
end, { desc = '[F]ormat buffer' })

-- Mixed
map({ 'n', 'v' }, 'd', '"_d')
map({ 'n', 'i', 'v' }, '<C-s>', function()
  if vim.bo.modified then
    vim.cmd 'write'
  end
end, { desc = 'Save file', silent = true })

vim.lsp.enable { 'lua_ls', 'svelte', 'vtsls', 'tailwindcss', 'nixd' }
