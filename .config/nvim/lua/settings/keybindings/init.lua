local bind = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

bind("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- normal
bind("n","<leader>t",":NvimTreeToggle<CR>",opts)
bind("n","<leader>l",":LspInstallInfo<CR>",opts)

-- Move to previous/next
bind('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
bind('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
bind('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
bind('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
bind('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
bind('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
bind('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
bind('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
bind('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
bind('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
bind('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
bind('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
bind('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
bind('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
bind('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
bind('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
bind('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
bind('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
bind('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
bind('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
bind('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

