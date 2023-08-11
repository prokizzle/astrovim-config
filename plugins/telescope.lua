return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    {
      "prochri/telescope-all-recent.nvim",
      config = function()
        require("telescope-all-recent").setup {
          -- your config goes here
        }
      end,
    },
  },
}
