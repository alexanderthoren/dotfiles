return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = "*",
  opts = {
    provider = "copilot",
    copilot = {
      endpoint = "https://api.githubcopilot.com/",
      model = "claude-3.5-sonnet",
      proxy = nil, -- [protocol://]host[:port] Use this proxy
      allow_insecure = false, -- Do not allow insecure server connections
      timeout = 30000, -- Timeout in milliseconds
      temperature = 0.1, -- kinda creative
      max_tokens = 8192,
    },
  },
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  keys = {
    {
      "<leader>am",
      ':AvanteAsk "Generate a commit message for this changes following git convention."<cr>',
      mode = { "n" },
      desc = "Write commit message",
    },
  },
}
