local lspconfig = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local mason_lspconfig = require("mason-lspconfig")

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function()
        keymap.set(
          "n",
          "gr",
          "<cmd>Telescope lsp_references<CR>",
          { desc = "Show references" }
        )

        keymap.set(
          "n",
          "gD",
          vim.lsp.buf.declaration,
          { desc = "Go to declaration" }
        )

        keymap.set(
          "n",
          "gd",
          vim.lsp.buf.definition,
          { desc = "Go to definition" }
        )

        keymap.set(
          "n",
          "gi",
          "<cmd>Telescope lsp_implementations<CR>",
          { desc = "Show implementations" }
        )

        keymap.set(
          "n",
          "gt",
          "<cmd>Telescope lsp_type_definitions<CR>",
          { desc = "Show type definitions" }
        )

        keymap.set(
          { "n", "v" },
          "<leader><space>",
          vim.lsp.buf.code_action,
          { desc = "Show code actions" }
        )

        keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { desc = "Rename" })

        keymap.set(
          "n",
          "<leader>D",
          "<cmd>Telescope diagnostics bufnr=0<CR>",
          { desc = "Show buffer diagnostics" }
        )

        keymap.set(
          "n",
          "<leader>d",
          vim.diagnostic.open_float,
          { desc = "Show line diagnostics" }
        )

        keymap.set(
          "n",
          "[d",
          vim.diagnostic.goto_prev,
          { desc = "Go to previous diagnostic" }
        )

        keymap.set(
          "n",
          "]d",
          vim.diagnostic.goto_next,
          { desc = "Go to next diagnostic" }
        )

        keymap.set(
          "n",
          "K",
          vim.lsp.buf.hover,
          { desc = "Show documentation for what is under cursor" }
        )
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs =
      { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Configure sourcekit LSP
    vim.lsp.config.sourcekit = {
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      },
    }
    vim.lsp.enable("sourcekit")

    local handlers = {
      function(server_name)
        vim.lsp.config[server_name] = {
          capabilities = capabilities,
        }
        vim.lsp.enable(server_name)
      end,
      ["lua_ls"] = function()
        vim.lsp.config.lua_ls = {
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        }
        vim.lsp.enable("lua_ls")
      end,
      ["bashls"] = function()
        vim.lsp.config.bashls = {
          capabilities = capabilities,
        }
        vim.lsp.enable("bashls")
      end,
      ["ruff"] = function()
        vim.lsp.config.ruff = {
          capabilities = capabilities,
        }
        vim.lsp.enable("ruff")
      end,
      ["pyright"] = function()
        vim.lsp.config.pyright = {
          capabilities = capabilities,
        }
        vim.lsp.enable("pyright")
      end,
      ["ruby_lsp"] = function()
        vim.lsp.config.ruby_lsp = {
          capabilities = capabilities,
        }
        vim.lsp.enable("ruby_lsp")
      end,
      ["zls"] = function()
        vim.lsp.config.zls = {
          capabilities = capabilities,
        }
        vim.lsp.enable("zls")
      end,
    }

    mason_lspconfig.setup({ handlers = handlers })
  end,
}

return lspconfig
