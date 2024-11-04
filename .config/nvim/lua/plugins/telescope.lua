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
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    config = function()
      require("telescope").load_extension "fzf"
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
            sorter = require("telescope").extensions.fzf.native_fzf_sorter()
          }
        },
      })
      local wk = require("which-key")
      local builtin = require("telescope.builtin")

      wk.add({
        { "<leader>f",  group = "Find" },
        { "<leader>ff", "<CMD>Telescope frecency<CR>", desc = "Find File" },
        { "<leader>fo", "<CMD>Oil --float<CR>",        desc = "Open parent directory in Oil" },
        { "<leader>ft", group = "Text" },
        {
          "<leader>ftc",
          function()
            builtin.grep_string({
              path_display = { 'smart' },
              only_sort_text = true,
              word_match = "-w",
              search = '',
            })
          end,
          desc = "Find Text under Cursor"
        },
        {
          "<leader>ftl",
          function()
            builtin.grep_string({
              path_display = { 'smart' },
              only_sort_text = true,
            })
          end,
          desc = "Find Text"
        }
      })

      -- vim.keymap.set('n', '<leader>fc',
      --    function() builtin.lsp_workspace_symbols({ query = "", symbols = "class" }) end, {})
    end,
  }
}
