local status, twilight = pcall(require, 'twilight')
if (not status) then return end

twilight.setup {
  dimming = {
    alpha = 0.25,
    color = { "Normal", "#ffffff" },
    term_bg = "#000000",
    inactive = true,
  },
  context = 0,
  treesitter = true,
  expand = {
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {},
}
