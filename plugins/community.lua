return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.bars-and-lines.feline-nvim" },
  -- { import = "astrocommunity.bars-and-lines.scope-nvim" },
  -- { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  -- { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.bars-and-lines.statuscol-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.color.twilight-nvim" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.completion.tabnine-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  {
    import = "astrocommunity.editing-support.chatgpt-nvim",
  },
  { import = "astrocommunity.editing-support.cutlass-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  -- { import = "astrocommunity.editing-support.rainbow-delimiters-nvim", enabled = true },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.treej", enabled = false },
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise", enabled = false },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.motion.mini-basics", enabled = false },
  { import = "astrocommunity.motion.mini-bracketed" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.ruby", enabled = false },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.programming-language-support.csv-vim" },
  { import = "astrocommunity.programming-language-support.nvim-jqx" },
  -- { import = "astrocommunity.programming-language-support.rest-nvim" },
  { import = "astrocommunity.programming-language-support.web-tools-nvim" },
  { import = "astrocommunity.project.projectmgr-nvim" },
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.search.sad-nvim" },
  { import = "astrocommunity.search.nvim-hlslens" },
  { import = "astrocommunity.split-and-window.minimap-vim", enabled = false },
  { import = "astrocommunity.split-and-window.windows-nvim" },
  { import = "astrocommunity.syntax.hlargs-nvim" },
  { import = "astrocommunity.terminal-integration.vim-tpipeline" },
  -- { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
  { import = "astrocommunity.utility.neodim", enabled = false },
  {
    import = "astrocommunity.utility.noice-nvim",
    enabled = true,
    opts = {
      view = "cmdline_popup",
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      cmdline = {
        format = {
          search_down = {
            view = "cmdline",
          },
          search_up = {
            view = "cmdline",
          },
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
      messages = {
        view_error = "popup",
      },
    },
  },
  {
    import = "astrocommunity.workflow.bad-practices-nvim",
  },
  -- { import = "astrocommunity.workflow.hardtime-nvim" },
}
