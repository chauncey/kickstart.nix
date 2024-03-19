return {
	'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.ai').setup({ n_lines = 500 })
    require('mini.statusline').setup({
      set_vim_settings = false,
    })
    require('mini.surround').setup()
  end,
}
