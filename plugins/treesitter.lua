return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    ensure_installed = { "javascript", "typescript", "ruby", "tsx", "html", "css", "json", "toml", "vim" },
    incremental_selection = { enable = true },
  },
}
