return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "gleam",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        gleam = { mason = false },
        rust_analyzer = { mason = false },
        denols = { mason = false },
      },
    },
  },
}
