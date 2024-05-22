return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
         local config = require("nvim-treesitter.configs")
         config.setup({
            ensure_installed = {
               "bash",
               "dart",
               "json",
               "lua",
               "toml",
            },
            -- auto_install = true,
            highlight = { enable = true },
            indent = {
               enable = true,
               -- disable = { "dart" }
            },
         })
      end,
   },
   {
      -- Show code context (e.g. the class name or function name) at the top of the buffer
      "nvim-treesitter/nvim-treesitter-context",
   },
}
