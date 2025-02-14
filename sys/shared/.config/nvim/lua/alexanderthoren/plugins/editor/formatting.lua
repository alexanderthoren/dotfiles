return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        sh = { "shfmt" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        swift = { "swiftformat" },
        html = { "prettier" },
        xhtml = { "prettier" },
        python = { "ruff_format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        ruby = { "rubocop" },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
