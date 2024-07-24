return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function ()
    require("gitsigns").setup(
      signs = {
	add = { text = '+' },
	change = { text '~' },
	delete = { text = '_' },
	changedelete = { text = '~' },
      }

    )

  end,
}
