local function get_short_cwd()
   return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
end


local neotree_extension = {
   sections = {
      lualine_a = { get_short_cwd },
      lualine_y = { "branch" },
   },
   filetypes = { 'neo-tree' },
}

return {
   "nvim-lualine/lualine.nvim",
   config = function()
      require("lualine").setup({
         options = {
            theme = "tokyonight",
            component_separators = "|",
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
               "oil",
            },
            globalstatus = false,
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
            lualine_b = { 'diagnostics', "location" },
            lualine_c = {
               {
                  "navic",
                  color_correction = nil,
                  navic_opts = nil,
               },
            },
            lualine_x = { "diff" },
            lualine_y = { "branch" },
            lualine_z = {},
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
            lualine_b = { 'diagnostics', "location" },
            lualine_c = {
               {
                  "navic",
                  color_correction = nil,
                  navic_opts = nil,
               },
            },
            lualine_x = { "diff" },
            lualine_y = { "branch" },
            lualine_z = {},
         },
         extensions = { neotree_extension, "symbols-outline" },
      })
   end,
}
