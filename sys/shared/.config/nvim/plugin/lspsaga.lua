local saga_status, saga = pcall(require, 'lspsaga')
if (not saga_status) then return end

saga.setup {}

local keymap = vim.keymap.set

keymap('n', 'gh', ':Lspsaga lsp_finder<CR>')
keymap({'n', 'v'}, '<leader>ca', ':Lspsaga code_action<CR>')
keymap('n', 'gr', ':Lspsaga rename<CR>')
keymap('n', 'gp', ':Lspsaga peek_definition<CR>')
keymap('n', 'gd', ':Lspsaga goto_definition<CR>')
keymap('n', 'gtp', ':Lspsaga peek_type_definition<CR>')
keymap('n', 'gtd', ':Lspsaga goto_type_definition<CR>')
keymap('n', 'gsl', ':Lspsaga show_line_diagnostics<CR>')
keymap('n', 'gsb', ':Lspsaga show_buf_diagnostics<CR>')
keymap('n', 'gsw', ':Lspsaga show_workspace_diagnostics<CR>')
keymap('n', 'gsc', ':Lspsaga show_cursor_diagnostics<CR>')
keymap('n', '[e', ':Lspsaga diagnostic_jump_prev<CR>')
keymap('n', ']e', ':Lspsaga diagnostic_jump_next<CR>')
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
keymap('n', 'K', ':Lspsaga hover_doc<CR>')
