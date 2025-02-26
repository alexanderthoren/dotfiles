local auto_session = {
  "rmagatti/auto-session",
  lazy = true,
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = {
        "~/",
        "~/Developer/",
        "~/Downloads",
        "~/Documents",
        "~/Desktop/",
      },
    })
  end,
  keys = {
    {
      "<leader>sr",
      "<cmd>SessionRestore<CR>",
      mode = { "n" },
      desc = "Restore session for cwd",
    },
    {
      "<leader>ss",
      "<cmd>SessionSave<CR>",
      mode = { "n" },
      desc = "Save session for auto session root dir",
    },
  },
}

return auto_session
