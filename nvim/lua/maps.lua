local keymap = vim.keymap

local default_opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Leader maps 
keymap.set('n', '<leader>q', ':qa<cr>')
keymap.set('n', '<leader>q!', ':qa!<cr>')
keymap.set('n', '<leader>wq', ':wa<cr>:qa<cr>')
keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
keymap.set('n', '<leader>l', ':LspInstallInfo<cr>')
keymap.set('n', '<leader>f', ':Telescope find_files<cr>')
keymap.set('n', '<leader>p', ':MarkdownPreviewToggle<cr>')
keymap.set('n', '<leader>tt', ':ToggleTerm<cr>')
keymap.set('n', '<leader>tw', ':Twilight<cr>')
keymap.set('n', '<leader>o', ':SymbolsOutline<cr>')
keymap.set('n', '<leader>z', ':ZenMode<cr>')

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

keymap.set('n', 'te', ':tabe<Return>', default_opts )
keymap.set('n', 'tc', ':tabc<Return>', default_opts )
keymap.set('n', 'tn', 'gt', default_opts )

-- Move through windows
keymap.set('', 's<left>', '<C-w>h', default_opts)
keymap.set('', 's<down>', '<C-w>j', default_opts)
keymap.set('', 's<up>', '<C-w>k', default_opts)
keymap.set('', 's<right>', '<C-w>l', default_opts)
keymap.set('', 'sh', '<C-w>h', default_opts)
keymap.set('', 'sj', '<C-w>j', default_opts)
keymap.set('', 'sk', '<C-w>k', default_opts)
keymap.set('', 'sl', '<C-w>l', default_opts)

-- Move windows
keymap.set('', 'sH', '<C-w>H', default_opts)
keymap.set('', 'sJ', '<C-w>J', default_opts)
keymap.set('', 'sK', '<C-w>K', default_opts)
keymap.set('', 'sL', '<C-w>L', default_opts)

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><', default_opts)
keymap.set('n', '<C-w><right>', '<C-w>>', default_opts)
keymap.set('n', '<C-w><up>', '<C-w>+', default_opts)
keymap.set('n', '<C-w><down>', '<C-w>-', default_opts)
