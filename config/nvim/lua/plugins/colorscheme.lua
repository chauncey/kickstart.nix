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
  "folke/tokyonight.nvim",
	lazy = false,
  priority = 1000,
	config = function()
		vim.cmd.colorscheme 'tokyonight'
		vim.cmd.hi 'Normal guibg=NONE ctermbg=NONE'
	end,
}
