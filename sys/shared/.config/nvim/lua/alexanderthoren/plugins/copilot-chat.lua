return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    config = function()
      local chat = require("CopilotChat")

      chat.setup({})

      local keymap = vim.keymap

      keymap.set(
        "n",
        "<leader>cc",
        ":CopilotChatToggle<cr>",
        { desc = "Toggle Copilot Chat" }
      )
      keymap.set(
        "v",
        "<leader>ce",
        ":CopilotChatExplain<cr>",
        { desc = "Explain active selection" }
      )
      keymap.set(
        "v",
        "<leader>cr",
        ":CopilotChatReview<cr>",
        { desc = "Review active selection" }
      )
      keymap.set(
        "v",
        "<leader>cff",
        ":CopilotChatFix<cr>",
        { desc = "Fix active selection" }
      )
      keymap.set(
        "v",
        "<leader>co",
        ":CopilotChatOptimize<cr>",
        { desc = "Optimize active selection" }
      )
      keymap.set(
        "v",
        "<leader>cd",
        ":CopilotChatDocs<cr>",
        { desc = "Document active selection" }
      )
      keymap.set(
        "v",
        "<leader>ct",
        ":CopilotChatTests<cr>",
        { desc = "Generate tests for active selection" }
      )
      keymap.set(
        "n",
        "<leader>cfd",
        ":CopilotChatFixDiagnostic<cr>",
        { desc = "Assit with a diagnostic for issues in file" }
      )
      keymap.set(
        "n",
        "<leader>cm",
        ":CopilotChatCommit<cr>",
        { desc = "Write commit message" }
      )
      keymap.set("n", "<leader>ccq", function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(
            input,
            { selection = require("CopilotChat.select").buffer }
          )
        end
      end, { desc = "CopilotChat - Quick chat" })
    end,
  },
}
