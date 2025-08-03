-- [[ Basic Keymaps ]]
-- TODO: Things to add
-- 1. resize the panes in vim
-- 2. make one pane bigger and then back to normal
--
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '//', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', ':q <CR>', { desc = 'Close tab' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<cmd>:TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<C-l>', '<cmd>:TmuxNavigateRight<cr>')
vim.keymap.set('n', '<C-j>', '<cmd>:TmuxNavigateDown<cr>')
vim.keymap.set('n', '<C-k>', '<cmd>:TmuxNavigateUp<cr>')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
