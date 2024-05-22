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
         -- widget_guides = {
         --    enabled = true,
         -- },
         lsp = {
            capabilities = lsp_zero.get_capabilities(),
            color = {
               enabled = true,
               background = true,
               virtual_text = false,
            },
            settings = {
               lineLength = 80,
               renameFilesWithClasses = 'always',
            },
         },
      })
   end,
}
