return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    -- Add cursors above/below the main cursor.
    vim.keymap.set({ "n", "v" }, "<leader>rk", function()
      mc.addCursor("k")
    end, { desc = "Add cursor above main cursor." })
    vim.keymap.set({ "n", "v" }, "<leader>rj", function()
      mc.addCursor("j")
    end, { desc = "Add cursor below main cursor." })

    vim.keymap.set({ "n", "v" }, "<leader>rn", function()
      mc.addCursor("*")
    end, { desc = "Add cursor and jump to next word." })

    vim.keymap.set({ "n", "v" }, "<leader>rs", function()
      mc.skipCursor("*")
    end, { desc = "Skip cursor and jump to next word." })

    vim.keymap.set(
      { "n", "v" },
      "<leader>rh",
      mc.nextCursor,
      { desc = "Rotate cursor to left." }
    )
    vim.keymap.set(
      { "n", "v" },
      "<leader>rl",
      mc.prevCursor,
      { desc = "Rotate cursor to right." }
    )

    vim.keymap.set(
      { "n", "v" },
      "<leader>rx",
      mc.deleteCursor,
      { desc = "Delete cursor." }
    )

    vim.keymap.set(
      "n",
      "<c-leftmouse>",
      mc.handleMouse,
      { desc = "Add cursor with ctrl + left click." }
    )

    vim.keymap.set({ "n", "v" }, "<leader>rq", function()
      if mc.cursorsEnabled() then
        mc.disableCursors()
      else
        mc.addCursor()
      end
    end, {
      desc = "Stop other cursors from moving. Allows for repositioning main cursor.",
    })

    vim.keymap.set("n", "<esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      end
    end, { desc = "Clear cursors." })

    vim.keymap.set(
      "n",
      "<leader>ra",
      mc.alignCursors,
      { desc = "Align cursors columns." }
    )

    vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
    vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
  end,
}
