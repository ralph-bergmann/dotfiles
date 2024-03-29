return {
   { "williamboman/mason.nvim" },
   { "williamboman/mason-lspconfig.nvim" },
   {
      -- Simple winbar/statusline plugin that shows your current code context
      "SmiteshP/nvim-navic",
      dependencies = {
         "neovim/nvim-lspconfig",
      },
      opts = {
         icons = {
            File = " ",
            Module = "󰆧 ",
            Namespace = " ",
            Package = "󰏗 ",
            Class = " ",
            Method = "󰊕 ",
            Property = " ",
            Field = " ",
            Constructor = " ",
            Enum = " ",
            Interface = " ",
            Function = "󰊕 ",
            Variable = " ",
            Constant = " ",
            String = "󰀬 ",
            Number = "󰎠 ",
            Boolean = " ",
            Array = "󰅪 ",
            Object = "󰅩 ",
            Key = "󰌋 ",
            Null = "󰟢 ",
            EnumMember = " ",
            Struct = " ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
         },
      },
   },
   {
      -- A simple popup display that provides breadcrumbs feature using LSP server
      "SmiteshP/nvim-navbuddy",
      dependencies = {
         "SmiteshP/nvim-navic",
         "MunifTanjim/nui.nvim",
      },
   },
   {
      -- A small Neovim plugin for previewing definitions using floating windows.
      'rmagatti/goto-preview',
      config = function()
         require('goto-preview').setup {}
      end
   },
   {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v3.x",
      config = function()
         local lsp_zero = require("lsp-zero")
         lsp_zero.extend_lspconfig()

         lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({
               buffer = bufnr,
               preserve_mappings = false,
            })

            -- null-ls and copilot are not supported by nvim-navic
            if client.name ~= "null-ls" and client.name ~= "copilot" then
               require("nvim-navic").attach(client, bufnr)
               require("nvim-navbuddy").attach(client, bufnr)
            end
         end)

         -- to learn how to use mason.nvim with lsp-zero
         -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
         require("mason").setup({})
         require("mason-lspconfig").setup({
            ensure_installed = {},
            handlers = {
               lsp_zero.default_setup,
            },
         })
      end,
   },
   { "neovim/nvim-lspconfig" }, -- Quickstart configs for Nvim LSP
   { "hrsh7th/cmp-nvim-lsp" },  -- nvim-cmp source for neovim builtin LSP client
   { "hrsh7th/cmp-buffer" },    -- nvim-cmp source for buffer words
   { "hrsh7th/cmp-path" },      -- nvim-cmp source for path
   { "hrsh7th/cmp-cmdline" },   -- nvim-cmp source for cmdline
   {
      -- A completion plugin for neovim coded in Lua.
      "hrsh7th/nvim-cmp",
      config = function()
         local cmp = require("cmp")
         local lsp_zero = require('lsp-zero')

         lsp_zero.set_sign_icons({
            error = '󰅚 ', -- x000f015a
            warn = '󰀪 ', -- x000f002a
            info = '󰋽 ', -- x000f02fd
            hint = '󰌶 ', -- x000f0336
         })

         cmp.setup({
            mapping = cmp.mapping.preset.insert({
               -- `Enter` key to confirm completion
               ["<CR>"] = cmp.mapping.confirm({ select = true }),

               -- Ctrl+Space to trigger completion menu
               ["<C-Space>"] = cmp.mapping.complete(),

               -- Navigate between snippet placeholder
               -- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
               -- ["<C-b>"] = cmp_action.luasnip_jump_backward(),

               -- Scroll up and down in the completion documentation
               ["<C-j>"] = cmp.mapping.scroll_docs(4),
               ["<C-k>"] = cmp.mapping.scroll_docs(-4),
            }),
         })

         -- Use buffer source for `/` and `?`
         cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
               { name = "buffer" },
            },
         })

         -- Use cmdline & path source for ':'
         cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
               { name = "path" },
            }, {
               {
                  name = "cmdline",
                  option = {
                     ignore_cmds = { "Man", "!" },
                  },
               },
            }),
         })
      end,
   },
   { "L3MON4D3/LuaSnip" },
   {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
         require("lsp_lines").setup()
      end,

      -- Disable virtual_text since it's redundant due to lsp_lines.
      vim.diagnostic.config({
         virtual_text = false,
      }),
   },
}
