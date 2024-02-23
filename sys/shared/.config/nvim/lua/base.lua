local v = vim.opt
local g = vim.g

-- Tree
-- Need to be disabled at very start for performance
g.loaded = 1
g.loaded_netrwPlugin = 1

-- General
v.clipboard:append { 'unnamedplus' }
v.termguicolors = true
v.hlsearch = true
v.number = true
v.relativenumber = true
v.breakindent = true
v.ignorecase = true
v.updatetime = 250
v.shiftwidth = 4
v.tabstop = 4
v.softtabstop = 4
v.textwidth = 120

-- Whichkey
v.timeoutlen = 1000

-- Cmp
v.completeopt = {'menu', 'menuone', 'noselect'}

vim.cmd('autocmd BufRead,BufNewFile *.stencil set filetype=htmldjango')
