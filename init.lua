return {
  -- Configure AstroNvim updates
  --
  updater = {
    channel = "stable",
    remote = "origin",
    version = "latest",
    branch = "nightly",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = true,
    show_changelog = true,
    auto_quit = true,
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assumes user/AstroNvim.git
    -- },
  },
  -- Set colorscheme to use
  colorscheme = "everforest",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
      },
      timeout_ms = 3200, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    -- servers = {
    --   -- "pyright"
    -- },
    setup_handlers = {
      -- add custom handler
      tsserver = function(_, opts) require("typescript").setup { server = opts } end,
    },
  },
  plugins = {
    "AstroNvim/astrocommunity",
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.rufo,
        -- Set a linter
        -- null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.diagnostics.semgrep,
        -- null_ls.builtins.formatting.rubocop,
        -- null_ls.builtins.diagnostics.rubocop.with {
        --   command = "bundle",
        --   args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.diagnostics.rubocop._opts.args),
        -- },
        -- null_ls.builtins.formatting.rubocop.with {
        --   command = "bundle",
        --   args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.formatting.rubocop._opts.args),
        -- },
        null_ls.builtins.formatting.erb_format,
        null_ls.builtins.formatting.erb_lint,
        null_ls.builtins.formatting.rubyfmt,
        -- null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.code_actions.eslint_d,
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.diagnostics.prettier,
        -- null_ls.builtins.formatting.eslint_d,
        -- null_ls.builtins.formatting.prettier_eslint,
        -- null_ls.builtins.diagnostics.prettier_eslint,
        -- null_ls.builtins.code_actions.xo,
      }
      -- set up null-ls's on_attach function
      -- config.on_attach = function(client)
      --   -- NOTE: You can remove this on attach function to disable format on save
      --   if client.resolved_capabilities.document_formatting then
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       desc = "Auto format before save",
      --       pattern = "<buffer>",
      --       callback = vim.lsp.buf.formatting_sync,
      --     })
      --   end
      -- end
      return config -- return final config table
    end,
  },
  mappings = {
    n = {
      ["<leader>c"] = {
        function()
          local bufs = vim.fn.getbufinfo { buflisted = true }
          require("astronvim.utils.buffer").close(0)
          if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
        end,
        desc = "Close buffer",
      },
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin", "matchparen" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    local g = vim.g

    g["node_host_prog"] = vim.call("system", 'which neovim-node-host | tr -d "\n"')
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
