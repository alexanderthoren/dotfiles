return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      direction = "float",
    })

    local keymap = vim.keymap

    keymap.set("n", "<C-\\>", ":ToggleTerm<cr>", { desc = "Toggle Terminal" })

    local function set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      -- vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      -- vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      -- vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      -- vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      -- vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    vim.api.nvim_create_augroup("TerminalKeymaps", { clear = true })
    vim.api.nvim_create_autocmd("TermOpen", {
      group = "TerminalKeymaps",
      pattern = "*",
      callback = function()
        set_terminal_keymaps()
      end,
    })
  end,
}
