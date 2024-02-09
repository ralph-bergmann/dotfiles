return {
   "nvim-lualine/lualine.nvim",
   config = function()
      local navic = require("nvim-navic")
      require("lualine").setup({
         options = {
            theme = "tokyonight",
            component_separators = "|",
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
               "neo-tree",
            },
         },
         sections = {
            lualine_a = {
               {
                  "filename",
                  file_status = true,
                  newfile_status = true,
                  path = 1,
                  symbols = {
                     modified = "󱇨",
                     readonly = "󱀰",
                     unnamed = "󱀷",
                     newfile = "󰻭",
                  },
               },
            },
            lualine_b = { "location" },
            lualine_c = {
               {
                  "navic",
                  color_correction = nil,
                  navic_opts = nil,
               },
            },
            lualine_x = { "diff", "diagnostics" },
            lualine_y = { "branch" },
            lualine_z = { "mode" },
         },
         inactive_sections = {
            lualine_a = {
               {
                  "filename",
                  file_status = true,
                  newfile_status = true,
                  path = 1,
                  symbols = {
                     modified = "󱇨",
                     readonly = "󱀰",
                     unnamed = "󱀷",
                     newfile = "󰻭",
                  },
               },
            },
            lualine_b = { "location" },
            lualine_c = {
               {
                  "navic",
                  color_correction = nil,
                  navic_opts = nil,
               },
            },
            lualine_x = { "diff", "diagnostics" },
            lualine_y = { "branch" },
            lualine_z = { "mode" },
         },
         -- extensions = { "neo-tree", "symbols-outline" },
      })
   end,
}
