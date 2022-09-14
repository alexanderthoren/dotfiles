local keymap = vim.keymap

local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>', default_opts)
keymap.set('n', '-', '<C-x>', default_opts)

-- Center search results
keymap.set('n', 'n', 'nzz', default_opts)
keymap.set('n', 'N', 'Nzz', default_opts)

-- Select all file
keymap.set('n', '<C-a>', 'gg<S-v>G', default_opts)

-- Tabs and Splits
keymap.set('n', 'se', ':tabedit<Return>', expr_opts )
keymap.set('n', 'sc', ':close<Return>', expr_opts )
keymap.set('n', 'ss', ':split<Return><C-w>w', expr_opts )
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', expr_opts )

-- Move windows
keymap.set('n', '<Space>', '<C-w>w', expr_opts)
keymap.set('', 's<left>', '<C-w>h', expr_opts)
keymap.set('', 's<down>', '<C-w>j', expr_opts)
keymap.set('', 's<up>', '<C-w>k', expr_opts)
keymap.set('', 's<right>', '<C-w>l', expr_opts)
keymap.set('', 'sh', '<C-w>h', expr_opts)
keymap.set('', 'sj', '<C-w>j', expr_opts)
keymap.set('', 'sk', '<C-w>k', expr_opts)
keymap.set('', 'sl', '<C-w>l', expr_opts)

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><', expr_opts)
keymap.set('n', '<C-w><right>', '<C-w>>', expr_opts)
keymap.set('n', '<C-w><up>', '<C-w>+', expr_opts)
keymap.set('n', '<C-w><down>', '<C-w>-', expr_opts)
