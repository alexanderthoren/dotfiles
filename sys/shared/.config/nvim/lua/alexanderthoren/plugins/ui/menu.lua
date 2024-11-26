return {
  enabled = false,
  "nvzone/menu",
  dependencies = {
    "nvzone/volt",
  },
  config = function()
    local menu = require("menu")

    local sep = { name = "separator" }

    local m_misc = {
      {
        name = "Hurl",
        items = {
          {
            name = " Run File",
            cmd = "CopilotChatToggle",
            hl = "WarningMsg",
          },
          sep,
          {
            name = " Run At",
            cmd = "CopilotChatToggle",
            hl = "WarningMsg",
          },
          {
            name = " Run To Entry",
            cmd = "CopilotChatToggle",
            hl = "WarningMsg",
          },
        },
      },
    }

    local opts = {
      border = "true",
    }

    vim.keymap.set({ "n" }, "<leader>m", function()
      menu.open(m_misc, opts)
    end, { desc = "Open Misc Menu" })
  end,
}
