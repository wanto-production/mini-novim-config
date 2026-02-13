-- keymaps
local map = vim.keymap.set
local builtin = require 'telescope.builtin'
local extensions = require('telescope').extensions

-- Telescope
map({ 'n' }, '<leader>sf', builtin.find_files, { desc = '[F] files' })
map({ 'n' }, '<leader>sd', builtin.diagnostics, { desc = '[F] diagnostic' })
map({ 'n' }, '<leader>sp', extensions.project.project, { desc = '[F] projects' })
map({ 'n' }, '<leader>sn', extensions.notify.notify, { desc = '[F] notifications' })
map({ 'n' }, '<leader>su', extensions.undo.undo, { desc = '[F] undo' })

-- =====================================
-- FILE & SEARCH
-- =====================================
map({ 'n' }, '<leader>sg', builtin.live_grep, { desc = '[F] live grep' })
map({ 'n' }, '<leader>sw', builtin.grep_string, { desc = '[F] word under cursor' })
map({ 'n' }, '<leader>sr', builtin.oldfiles, { desc = '[F] recent files' })
map({ 'n' }, '<leader>sb', builtin.buffers, { desc = '[F] buffers' })
map({ 'n' }, '<leader>sh', builtin.help_tags, { desc = '[F] help tags' })
map({ 'n' }, '<leader>sk', builtin.keymaps, { desc = '[F] keymaps' })
map({ 'n' }, '<leader>sc', builtin.commands, { desc = '[F] commands' })
map({ 'n' }, '<leader>sm', builtin.marks, { desc = '[F] marks' })
map({ 'n' }, '<leader>sj', builtin.jumplist, { desc = '[F] jumplist' })
map({ 'n' }, '<leader>sq', builtin.quickfix, { desc = '[F] quickfix' })

-- =====================================
-- GIT
-- =====================================
map({ 'n' }, '<leader>sgc', builtin.git_commits, { desc = '[G] commits' })
map({ 'n' }, '<leader>sgC', builtin.git_bcommits, { desc = '[G] buffer commits' })
map({ 'n' }, '<leader>sgb', builtin.git_branches, { desc = '[G] branches' })
map({ 'n' }, '<leader>sgs', builtin.git_status, { desc = '[G] status' })
map({ 'n' }, '<leader>sgS', builtin.git_stash, { desc = '[G] stash' })
map({ 'n' }, '<leader>sgf', builtin.git_files, { desc = '[G] files' })
map('n', '<leader>sgh', '<cmd>Telescope git_file_history<cr>', { desc = '[G] file history' })

-- =====================================
-- LSP
-- =====================================
map({ 'n' }, '<leader>slr', builtin.lsp_references, { desc = '[L] references' })
map({ 'n' }, '<leader>sld', builtin.lsp_definitions, { desc = '[L] definitions' })
map({ 'n' }, '<leader>slt', builtin.lsp_type_definitions, { desc = '[L] type definitions' })
map({ 'n' }, '<leader>sli', builtin.lsp_implementations, { desc = '[L] implementations' })
map({ 'n' }, '<leader>sls', builtin.lsp_document_symbols, { desc = '[L] document symbols' })
map({ 'n' }, '<leader>slw', builtin.lsp_workspace_symbols, { desc = '[L] workspace symbols' })

-- =====================================
-- MISC
-- =====================================
map({ 'n' }, '<leader>s/', builtin.current_buffer_fuzzy_find, { desc = '[F] current buffer' })
map({ 'n' }, '<leader>s:', builtin.command_history, { desc = '[F] command history' })
map({ 'n' }, '<leader>s;', builtin.search_history, { desc = '[F] search history' })
map({ 'n' }, '<leader>sR', builtin.resume, { desc = '[F] resume last picker' })
map({ 'n' }, '<leader>sC', builtin.colorscheme, { desc = '[F] colorscheme' })
map({ 'n' }, '<leader>sH', builtin.highlights, { desc = '[F] highlights' })
map({ 'n' }, '<leader>sA', builtin.autocommands, { desc = '[F] autocommands' })
map({ 'n' }, '<leader>sO', builtin.vim_options, { desc = '[F] vim options' })

-- Find files including hidden/ignored
map({ 'n' }, '<leader>sF', function()
  builtin.find_files({ hidden = true, no_ignore = true })
end, { desc = '[F] all files (hidden)' })

-- Terminal

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
map('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = '[E]xplorer' }) -- UPDATE
map('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Buffer [D]elete' })
map('n', '<leader>bD', '<cmd>bdelete!<CR>', { desc = 'Buffer [D]elete!' })
map('n', '[b', '<cmd>bprevious<CR>', { desc = 'Prev Buffer' }) -- UPDATE (no BufferLine)
map('n', ']b', '<cmd>bnext<CR>', { desc = 'Next Buffer' })     -- UPDATE (no BufferLine)
map('n', '<leader>r', function()
  require('conform').format { async = true, lsp_fallback = true }
end, { desc = '[F]ormat buffer' })

-- Mixed
map({ 'n', 'i' }, '<leader>tt', ':ToggleTerm<CR>', { desc = "[T] term" })
map({ 'n', 'v' }, 'd', '"_d')
map({ 'n', 'i', 'v' }, '<C-s>', function()
  if vim.bo.modified then
    vim.cmd 'write'
  end
end, { desc = 'Save file', silent = true })
