local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all file
keymap.set('n', '<C-a>', 'gg<S-v>G') 

-- Tabs and Splits
keymap.set('n', 'se', ':tabedit<Return>', { silent = true } )
keymap.set('n', 'sc', ':close<Return>', { silent = true } )
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true } )
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true } )

-- Move windows
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
