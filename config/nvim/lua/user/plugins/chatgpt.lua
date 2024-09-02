return {
  {
    "jackMort/ChatGPT",
    event = "VeryLazy",
    config = function()
      require("ChatGPT").setup()
    end,
    dependencies = {
      "MunifTanjjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    }
  },
}

