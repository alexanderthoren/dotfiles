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
    local open_ith_trouble = require("trouble.sources.telescope").open
    local add_to_trouble = require("trouble.sources.telescope").add

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
            ["<C-t>"] = open_ith_trouble,
            ["<C-a>"] = add_to_trouble,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = file_ignore_patterns,
          path_display = { "absolute" },
        },
        oldfiles = {
          hidden = true,
          file_ignore_patterns = file_ignore_patterns,
          path_display = { "absolute" },
        },
        live_grep = {
          hidden = true,
          file_ignore_patterns = file_ignore_patterns,
          path_display = { "absolute" },
          additional_args = function()
            return { "--hidden" }
          end,
        },
        grep_string = {
          hidden = true,
          file_ignore_patterns = file_ignore_patterns,
          path_display = { "absolute" },
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
      ":Telescope resume<cr>",
      { desc = "Resume last search in telescope" }
    )
    keymap.set(
      "n",
      "<leader>fo",
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
