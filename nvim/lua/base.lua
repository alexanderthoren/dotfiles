local v = vim.opt
local g = vim.g

-- Tree
-- Need to be disabled at very start for performance
g.loaded = 1
g.loaded_netrwPlugin = 1

-- General
v.hlsearch = true -- Set highlight on search
v.number = true -- Make line numbers default
v.breakindent = true -- Enable break indent
v.ignorecase = true -- Case insensitive searching unless /C or capital in search
v.updatetime = 250 -- Decrease update time
v.shiftwidth = 4
v.tabstop = 4
v.softtabstop = 4
v.textwidth = 120

-- Whichkey
v.timeoutlen = 500 -- Time in ms to wait for a mapped sequence to complete

-- MKDP
g.mkdp_auto_start = 1

