return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    opts = {
      sources = { "filesystem", "buffers", "git_status" },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      }
    },
    config = function()
      vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal right<CR>', {})
    end
  }
}
