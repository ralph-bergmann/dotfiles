return {
   "nvim-neo-tree/neo-tree.nvim",
   branch = "v3.x",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
   },
   config = function()
      vim.keymap.set("n", "<leader>ft", "<CMD>Neotree filesystem reveal float<CR>", {
         desc = "Open Neotree in a floating window",
      })

      require("neo-tree").setup({
         -- show file tree and git status in the left side window
         -- source_selector = {
         --    winbar = true,
         --    sources = {
         --       { source = "filesystem" },
         --       { source = "git_status" },
         --    },
         -- },
         filesystem = {
            filtered_items = {
               visible = true,
               never_show = {
                  ".DS_Store",
               },
            },
            follow_current_file = {
               enabled = true,          -- This will find and focus the file in the active buffer every time
               leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
         },
      })
   end,
}
