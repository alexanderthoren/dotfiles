return {
  "mfussenegger/nvim-dap-python",
  config = function()
    local dap = require("dap-python")

    dap.setup("~/pyenv/bin/python")
  end,
}
