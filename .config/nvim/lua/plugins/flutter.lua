return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    local lsp_zero = require("lsp-zero")
    require("flutter-tools").setup({
      fvm = true,
      widget_guides = {
        enabled = true,
      },
      lsp = {
        capabilities = lsp_zero.get_capabilities(),
        color = {
          enabled = true,
          background = true,
          virtual_text = false,
        },
        settings = {
          lineLength = 120,
          renameFilesWithClasses = 'always',
        },
      },
    })
  end,
}
