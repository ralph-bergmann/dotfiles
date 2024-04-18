return {
   {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
         require("telescope").load_extension("ui-select")
      end,
   },
   {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
         require("telescope").load_extension "frecency"
      end,
   },
   {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.5",
      dependencies = {
         "nvim-lua/plenary.nvim"
      },
      config = function()
         require("telescope").setup({
            extensions = {
               ui_select = {
                  require("telescope.themes").get_dropdown({}),
               },
               frecency = {
                  default_workspace = 'CWD',
                  show_filter_column = false,
               }
            },
         })
         local wk = require("which-key")
         local builtin = require("telescope.builtin")

         wk.register({
            f = {
               name = "Find",
               -- f = { builtin.find_files, "Find File" },
               f = { '<CMD>Telescope frecency<CR>', "Find File" },
               o = { '<CMD>Oil --float<CR>', "Open parent directory in Oil" },
               t = {
                  name = "Text",
                  l = { builtin.live_grep, "Find Text" },
                  c = { builtin.grep_string, "Find Text under Cursor" },
               },
            },
         }, { prefix = "<leader>" })

         -- vim.keymap.set('n', '<leader>fc',
         --    function() builtin.lsp_workspace_symbols({ query = "", symbols = "class" }) end, {})
      end,
   }
}
