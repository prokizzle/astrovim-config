return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "suketa/nvim-dap-ruby",
    name = "dap-ruby",
    opts = {
      configurations = {
        ruby = {
          type = "ruby",
          request = "launch",
          command = "",
        },
      },
    },
  },
}
