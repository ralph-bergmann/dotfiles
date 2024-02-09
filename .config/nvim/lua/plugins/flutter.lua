return {
   "akinsho/flutter-tools.nvim",
   lazy = false,
   dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
   },
   config = function()
      require("flutter-tools").setup({
         widget_guides = {
            enabled = true,
         },
         lsp = {
            color = {
               enabled = true,
               background = true,
               virtual_text = false,
            },
            settings = {
               lineLength = 120,
            },
         },
      })
   end,
}
