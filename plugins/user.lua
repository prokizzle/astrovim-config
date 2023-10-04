return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- {
  --   "prochri/telescope-all-recent.nvim",
  --   config = function()
  --     require("telescope-all-recent").setup {
  --       -- your config goes here
  --     }
  --   end,
  --   dependencies = {
  --     "kkharji/sqlite.lua",
  --   },
  -- },
  {
    "nvim-neotest/neotest",
    ft = { "ruby" }, -- Only Ruby is left
    dependencies = {
      "olimorris/neotest-rspec",
      {
        "folke/neodev.nvim",
        opts = function(_, opts)
          opts.library = opts.library or {}
          if opts.library.plugins ~= true then
            opts.library.plugins = require("astronvim.utils").list_insert_unique(opts.library.plugins, "neotest")
          end
          opts.library.types = true
        end,
      },
    },
    opts = function()
      return {
        adapters = {
          require "neotest-rspec" {
            rspec_cmd = function()
              return vim.tbl_flatten {
                "docker",
                "compose",
                "exec",
                "-i",
                "-w",
                "/app",
                "-e",
                "RAILS_ENV=test",
                "web",
                "bundle",
                "exec",
                "rspec",
              }
            end,

            transform_spec_path = function(path)
              local prefix = require("neotest-rspec").root(path)
              return string.sub(path, string.len(prefix) + 2, -1)
            end,

            results_path = "tmp/rspec.output",
          },
        },
      }
    end,
    config = function(_, opts)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup(opts)
    end,
  },
}
