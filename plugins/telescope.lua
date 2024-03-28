local filter_cwd = function(prompt_bufnr, map)
  local function is_in_cwd(entry) return vim.fn.getcwd() == vim.fn.fnamemodify(entry.value, ":p:h") end

  require("telescope.builtin").oldfiles {
    attach_mappings = function()
      map("i", "<CR>", function(bufnr)
        local selection = require("telescope.actions.state").get_selected_entry(bufnr)
        if is_in_cwd(selection) then require("telescope.actions").file_edit(bufnr) end
      end)
      return true
    end,
  }
end

return {
  "nvim-telescope/telescope.nvim",
  requires = { { "nvim-lua/plenary.nvim" } },
  opts = {
    defaults = {
      -- Your default config
    },
    extensions = {
      custom_filter = {
        oldfiles_cwd = filter_cwd,
      },
    },
  },
}
