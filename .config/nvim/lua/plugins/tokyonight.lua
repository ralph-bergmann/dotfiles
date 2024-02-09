return {
   "folke/tokyonight.nvim",
   lazy = false,
   priority = 1000,
   opts = {
      style = "night",
      on_highlights = function(highlights, colors)
         highlights.WinSeparator = { fg = colors.blue7 }
         highlights.CursorLineNr = { fg = colors.green }
         highlights.IlluminatedWordText = { bg = "#4F69A1", fg = "#E6EAFF" }
         highlights.IlluminatedWordRead = { bg = "#5B773D", fg = "#E6EAFF" }
         highlights.IlluminatedWordWrite = { bg = "#A04D5C", fg = "#E6EAFF" }
      end,
   },
   config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
   end,
}
