vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "sf", ":source %<CR>", { desc = "Source file" })

keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Quit all buffers and exit" })
keymap.set(
  "n",
  "<leader>q!",
  ":qa!<CR>",
  { desc = "Quit all buffers and exit without saving them" }
)
keymap.set("n", "<leader>w", ":w!<CR>", { desc = "Save current buffer" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all file" })

keymap.set("n", "yp", "yyp", { desc = "Duplicate line" })
keymap.set("n", "ya", "gg<S-v>Gy", { desc = "Yank all file" })

keymap.set("n", "da", "gg<S-v>Gd", { desc = "Delete all file" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Navigate down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Navigate up and center" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set(
  "n",
  "<leader>se",
  "<C-w>=",
  { desc = "Make split windows equal size" }
)
keymap.set(
  "n",
  "<leader>sc",
  "<cmd>close<CR>",
  { desc = "Close current split" }
)
keymap.set(
  "n",
  "<leader>sx",
  "<C-w><C-x>",
  { desc = "Exchange current splits" }
)

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to window at the left" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the window below" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the window above" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the window at the right" })
keymap.set(
  "n",
  "<leader><C-h>",
  "<C-w>H",
  { desc = "Swap to window at the left" }
)
keymap.set(
  "n",
  "<leader><C-J>",
  "<C-w>J",
  { desc = "Swap to the window below" }
)
keymap.set(
  "n",
  "<leader><C-K>",
  "<C-w>K",
  { desc = "Swap to the window above" }
)
keymap.set(
  "n",
  "<leader><C-L>",
  "<C-w>L",
  { desc = "Swap to the window at the right" }
)

keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set(
  "n",
  "<leader>tc",
  "<cmd>tabclose<CR>",
  { desc = "Close current tab" }
)
keymap.set("n", "<leader>t.", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>t,", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set(
  "n",
  "<leader>to",
  "<cmd>tabnew %<CR>",
  { desc = "Open current buffer in new tab" }
)

keymap.set("n", "<leader>lz", ":Lazy<CR>", { desc = "Open Lazy" })
keymap.set("n", "<leader>mn", ":Mason<CR>", { desc = "Open Mason" })
