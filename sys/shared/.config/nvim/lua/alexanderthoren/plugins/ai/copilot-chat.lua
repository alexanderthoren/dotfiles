local copilot_chat = {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
    { "MeanderingProgrammer/markdown.nvim" },
  },
  config = function()
    local chat = require("CopilotChat")

    chat.setup({
      model = "claude-3.5-sonnet",
      highlight_headers = false,
      separator = "---",
      error_header = "> [!ERROR] Error",
    })
  end,
  keys = {
    {
      "<leader>cc",
      ":CopilotChatToggle<cr>",
      mode = { "n" },
      desc = "Toggle Copilot Chat",
    },
    {
      "<leader>ce",
      ":CopilotChatExplain<cr>",
      mode = { "v" },
      desc = "Explain active selection",
    },
    {
      "<leader>cr",
      ":CopilotChatReview<cr>",
      mode = { "v" },
      desc = "Review active selection",
    },
    {
      "<leader>cf",
      ":CopilotChatFix<cr>",
      mode = { "v" },
      desc = "Fix active selection",
    },
    {
      "<leader>co",
      ":CopilotChatOptimize<cr>",
      mode = { "v" },
      desc = "Optimize active selection",
    },
    {
      "<leader>cd",
      ":CopilotChatDocs<cr>",
      mode = { "v" },
      desc = "Document active selection",
    },
    {
      "<leader>ct",
      ":CopilotChatTests<cr>",
      mode = { "v" },
      desc = "Generate tests for active selection",
    },
    {
      "<leader>cx",
      ":CopilotChatFixDiagnostic<cr>",
      mode = { "n" },
      desc = "Assit with a diagnostic for issues in file",
    },
    {
      "<leader>cm",
      ":CopilotChatCommit<cr>",
      mode = { "n" },
      desc = "Write commit message",
    },
    {
      "<leader>cq",
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(
            input,
            { selection = require("CopilotChat.select").buffer }
          )
        end
      end,
      mode = { "n" },
      desc = "CopilotChat - Quick chat",
    },
  },
}

return {}
