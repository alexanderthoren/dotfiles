local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "alexanderthoren.plugins" },
  { import = "alexanderthoren.plugins.ai" },
  { import = "alexanderthoren.plugins.color" },
  { import = "alexanderthoren.plugins.debug" },
  { import = "alexanderthoren.plugins.find" },
  { import = "alexanderthoren.plugins.editor" },
  { import = "alexanderthoren.plugins.generate" },
  { import = "alexanderthoren.plugins.git" },
  { import = "alexanderthoren.plugins.lsp" },
  { import = "alexanderthoren.plugins.session" },
  { import = "alexanderthoren.plugins.terminal" },
  { import = "alexanderthoren.plugins.test" },
  { import = "alexanderthoren.plugins.ui" },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
