return {
   "folke/flash.nvim",
   event = "VeryLazy",
   ---@type Flash.Config
   -- stylua: ignore
   opts = {
      modes = {
         search = {
            enabled = true,
         }
      }
   },
   keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
   },
}
