return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    {
      "danielfalk/smart-open.nvim",
      branch = "0.2.x",
      dependencies = {
        "kkharji/sqlite.lua",
      },
    },
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
        smart_open = {
          hidden = true,
          file_ignore_patterns = file_ignore_patterns,
          path_display = { "absolute" },
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("smart_open")

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
      ":Telescope smart_open<cr>",
      { desc = "Smartly find recent files" }
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
    keymap.set(
      "n",
      "<leader>fq",
      ":Telescope quickfix<CR>",
      { desc = "Show QuickFix List" }
    )
  end,
}
