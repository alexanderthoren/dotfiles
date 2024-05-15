return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod
    local trouble = require("trouble")
    local trouble_telescope = require("trouble.providers.telescope")

    local custom_actions = transform_mod({
      open_trouble_qflist = function()
        trouble.toggle("quickfix")
      end,
    })

    local file_ignore_patterns = {
      ".git/",
      ".bundle/",
      ".bundle.xcresult/",
      "Build/",
      "Index.noindex",
      "Logs/",
      "ModuleCache.noindex/",
      "SDKStatCaches.noindex/",
      "SourcePackages/",
      "TestResults/",
    }

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist
              + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = file_ignore_patterns,
        },
        oldfiles = {
          hidden = true,
          file_ignore_patterns = file_ignore_patterns,
        },
        live_grep = {
          hidden = true,
          file_ignore_patterns = file_ignore_patterns,
          additional_args = function()
            return { "--hidden" }
          end,
        },
        grep_string = {
          hidden = true,
          file_ignore_patterns = file_ignore_patterns,
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>ff",
      ":Telescope find_files<cr>",
      { desc = "Find files in current working directory" }
    )
    keymap.set(
      "n",
      "<leader>fr",
      ":Telescope oldfiles<cr>",
      { desc = "Find recently open files" }
    )
    keymap.set(
      "n",
      "<leader>fs",
      ":Telescope live_grep<cr>",
      { desc = "Find string in current working directory" }
    )
    keymap.set(
      "n",
      "<leader>fc",
      ":Telescope grep_string<cr>",
      { desc = "Find string under cursor in current working directory" }
    )
    keymap.set(
      "n",
      "<leader>fd",
      ":Telescope git_status<cr>",
      { desc = "Find changed files in Git" }
    )
    keymap.set("n", "<leader>ft", ":TodoTelescope<cr>", { desc = "Find TODOs" })
  end,
}
