local keymap = vim.keymap

local default_opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Leader maps 
keymap.set('n', '<leader>q', ':qa<cr>')
keymap.set('n', '<leader>q!', ':qa!<cr>')
keymap.set('n', '<leader>wq', ':wa<cr>:qa<cr>')
keymap.set('n', '<leader>ww', ':w<cr>')
keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
keymap.set('n', '<leader>ms', ':Mason<cr>')
keymap.set('n', '<leader>f', ':Telescope find_files<cr>')
keymap.set('n', '<leader>mp', ':MarkdownPreviewToggle<cr>')
keymap.set('n', '<leader>tw', ':Twilight<cr>')
keymap.set('n', '<leader>tt', ':TodoTelescope<cr>')
keymap.set('n', '<leader>tr', ':TodoTrouble<cr>')
keymap.set('n', '<leader>tl', ':TodoLocList<cr>')
keymap.set('n', '<leader>tq', ':TodoQuickFix<cr>')
keymap.set('n', '<leader>o', ':SymbolsOutline<cr>')
keymap.set('n', '<leader>z', ':ZenMode<cr>')
keymap.set('n', '<leader>wsh', ':WinShift<cr>')
keymap.set('n', '<leader>wss', ':WinShift swap<cr>')
keymap.set('n', '<leader>h', ':HopWord<cr>')
keymap.set('n', '<leader>pst', ':PackerStatus<cr>')
keymap.set('n', '<leader>psy', ':PackerSync<cr>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Duplicate line
keymap.set('n', 'yp', 'yyp')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>', default_opts)
keymap.set('n', '-', '<C-x>', default_opts)

-- Center search results
keymap.set('n', 'n', 'nzz', default_opts)
keymap.set('n', 'N', 'Nzz', default_opts)

-- Center file navigation
keymap.set('n', '<C-d>', '<C-d>zz', default_opts)
keymap.set('n', '<C-u>', '<C-u>zz', default_opts)

-- Select all file
keymap.set('n', '<C-a>', 'gg<S-v>G', default_opts)

-- Tabs and Splits
keymap.set('n', 'sc', ':close<Return>', default_opts )
keymap.set('n', 'ss', ':split<Return><C-w>w', default_opts )
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', default_opts )

-- Move through windows
keymap.set('', 's<left>', '<C-w>h', default_opts)
keymap.set('', 's<down>', '<C-w>j', default_opts)
keymap.set('', 's<up>', '<C-w>k', default_opts)
keymap.set('', 's<right>', '<C-w>l', default_opts)
keymap.set('', 'sh', '<C-w>h', default_opts)
keymap.set('', 'sj', '<C-w>j', default_opts)
keymap.set('', 'sk', '<C-w>k', default_opts)
keymap.set('', 'sl', '<C-w>l', default_opts)

-- Barbar
keymap.set('n', '<leader>bc', ':BufferClose<cr>')
keymap.set('n', '<leader>bp', ':BufferPin<cr>')
keymap.set('n', '<leader>bl', ':BufferNext<cr>')
keymap.set('n', '<leader>bh', ':BufferPrevious<cr>')
keymap.set('n', '<leader>bk', ':BufferMovePrevious<cr>')
keymap.set('n', '<leader>bj', ':BufferMoveNext<cr>')
keymap.set('n', '<leader>b1', ':BufferGoto 1<cr>')
keymap.set('n', '<leader>b2', ':BufferGoto 2<cr>')
keymap.set('n', '<leader>b3', ':BufferGoto 3<cr>')
keymap.set('n', '<leader>b4', ':BufferGoto 4<cr>')
keymap.set('n', '<leader>b5', ':BufferGoto 5<cr>')
keymap.set('n', '<leader>b6', ':BufferGoto 6<cr>')
keymap.set('n', '<leader>b7', ':BufferGoto 7<cr>')
keymap.set('n', '<leader>b8', ':BufferGoto 8<cr>')
keymap.set('n', '<leader>b9', ':BufferLast<cr>')
