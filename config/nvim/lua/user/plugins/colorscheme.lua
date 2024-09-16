-- return {
--   "catppuccin/nvim",
--  lazy = false,
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'catppuccin-latte'
--   end,
-- }
return {
  "catppuccin/nvim",
	lazy = false,
  priority = 1000,
  flavour = "macchiato",
  integrations = {
    cmp = true,
    gitsigns = true,
    treesitter = true,
    mini = {
      enabled = true,
      indentscope_color = true,
    },
  },
}
