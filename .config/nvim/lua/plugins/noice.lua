return {
   "folke/noice.nvim",
   event = "VeryLazy",
   dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
   },
   config = function()
      require("noice").setup({
         cmdline = {
            format = {
               cmdline = { pattern = "^:", icon = "", lang = "vim" },
               search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
               search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
               filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
               lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
               help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
               input = {}, -- Used by input()
            },
         },
         lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
               ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
               ["vim.lsp.util.stylize_markdown"] = true,
               ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
         },
         -- you can enable a preset for easier configuration
         presets = {
            bottom_search = false,        -- use a classic bottom cmdline for search
            command_palette = true,       -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false,           -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true,       -- add a border to hover docs and signature help
         },
      })
      require("telescope").load_extension("noice")
   end,
}
