local prefix = "<leader>n"
local maps = { n = {} }
maps.n[prefix] = { desc = "Neotest" }
require("astronvim.utils").set_mappings(maps)
return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
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
  keys = {
    { prefix .. "r", function() require("neotest").run.run(vim.fn.getcwd()) end, desc = "Test suite" },
    { prefix .. "f", function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Test file" },
    { prefix .. "l", function() require("neotest").run.run() end, desc = "Run last test" },
  },
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
  opts = function()
    return {
      adapters = {
        require "neotest-rspec" {
          rspec_cmd = function()
            return vim.tbl_flatten {
              "RAILS_ENV=test",
              "bundle",
              "exec",
              "rspec",
            }
          end,
        },
      },
      rspec = {
        command = "bundle exec rspec", -- Use the appropriate command for your Rails project
        file_pattern = "spec/*_spec.rb", -- Adjust this pattern to match your spec file location
        working_directory = vim.fn.getcwd(),
      },
    }
  end,
}
