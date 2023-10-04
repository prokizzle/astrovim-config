return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- this is a comment
    ensure_installed = { "markdown", "vim", "lua", "python", "rust", "javascript", "html", "css", "json", "toml", "regex" },
    auto_install = true,
    sync_install = false,
  },
}
