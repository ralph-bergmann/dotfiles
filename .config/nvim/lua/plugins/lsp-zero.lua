local function get_type_hierarchy(method)
  vim.lsp.buf_request(0, "textDocument/prepareTypeHierarchy", vim.lsp.util.make_position_params(), function(_, result)
    if not result then
      vim.notify_once("Does not support typeHierarchy", vim.log.levels.INFO)
      return
    end
    vim.lsp.buf_request(0, method, { item = result[1] }, function(_, res)
      if not res or #res == 0 then
        return
      end

      if #res == 1 then
        vim.lsp.util.jump_to_location(res[1], "utf-8", true)
        return
      end

      vim.ui.select(res, {
        format_item = function(item) ---@param item lsp.TypeHierarchyItem
          local kind = vim.lsp.protocol.SymbolKind[item.kind] or "Unknown"
          return kind .. ": " .. item.name
        end,
        prompt = "Jump to definition",
      }, function(item) ---@param item lsp.TypeHierarchyItem
        if item then
          vim.lsp.util.jump_to_location(item, "utf-8", true)
        end
      end)
    end)
  end)
end


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
      require('goto-preview').setup({
        width = 120,
        height = 30,
      })
    end
  },
  {
    "aznhe21/actions-preview.nvim",
    config = function()
      require("actions-preview").setup({
        telescope = { layout_strategy = "horizontal" },
      })
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
      local lsp_zero = require("lsp-zero")
      local actions_preview = require("actions-preview")
      local goto_preview = require("goto-preview")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false,
          exclude = { '<F4>', 'gD', 'gr', 'gi', },
        })
        vim.keymap.set("n", "<F4>", actions_preview.code_actions, { buffer = bufnr, desc = "Preview Code Action" })
        vim.keymap.set("n", "gp", goto_preview.goto_preview_definition,
          { buffer = bufnr, desc = "Preview Definition" })
        vim.keymap.set("n", "gc", goto_preview.close_all_win, { buffer = bufnr, desc = "Close Preview" })
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr, desc = "List References" })
        vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>',
          { buffer = bufnr, desc = "List Implementations" })
        vim.keymap.set("n", "gt", function()
          get_type_hierarchy("typeHierarchy/supertypes")
        end, { buffer = bufnr, desc = "Go to super type" })

        -- null-ls and copilot are not supported by nvim-navic
        if client.name ~= "null-ls" and client.name ~= "copilot" then
          require("nvim-navic").attach(client, bufnr)
          require("nvim-navbuddy").attach(client, bufnr)
        end

        if vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true)
        end

        vim.diagnostic.config({
          severity_sort = true, -- sort diagnostics by severity
          virtual_text = false, -- disable virtual text
          float = {
            border = "rounded", -- customize the float border
            source = "always",  -- show source in diagnostic float
          },
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = '󰅚',
              [vim.diagnostic.severity.WARN] = '󰀪',
              [vim.diagnostic.severity.HINT] = '󰌶',
              [vim.diagnostic.severity.INFO] = '󰋽',
            },
            numhl = {
              [vim.diagnostic.severity.WARN] = "WarningMsg",
              [vim.diagnostic.severity.ERROR] = "ErrorMsg",
              [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
              [vim.diagnostic.severity.HINT] = "DiagnosticHint",
            },
          },
        })
      end)

      -- to learn how to use mason.nvim with lsp-zero
      -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {},
        handlers = { lsp_zero.default_setup },
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
      local cmp_action = require('lsp-zero').cmp_action()

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          -- `Enter` key to confirm completion
          ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),

          -- Ctrl+Space to trigger completion menu
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Closes the completion menu and restore the current line to the state before the current completion was started.
          ['<C-e>'] = cmp.mapping.abort(),

          -- Navigate between snippet placeholder
          ["<M-l>"] = cmp_action.luasnip_jump_forward(),
          ["<M-h>"] = cmp_action.luasnip_jump_backward(),

          -- Scroll up and down in the completion documentation
          ["<M-j>"] = cmp.mapping.scroll_docs(4),
          ["<M-k>"] = cmp.mapping.scroll_docs(-4),
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
  -- {
  --    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --    config = function()
  --       require("lsp_lines").setup()
  --    end,
  --
  --    -- Disable virtual_text since it's redundant due to lsp_lines.
  --    vim.diagnostic.config({
  --       virtual_text = false,
  --    }),
  -- },
  -- {
  --   'dgagn/diagflow.nvim',
  --   -- event = 'LspAttach', -- This is what I use personnally and it works great
  --   opts = {
  --     -- enable = true,
  --     -- max_width = 120, -- The maximum width of the diagnostic messages
  --     -- max_height = 10, -- the maximum height per diagnostics
  --     -- severity_colors = { -- The highlight groups to use for each diagnostic severity level
  --     --    error = "DiagnosticFloatingError",
  --     --    warning = "DiagnosticFloatingWarn",
  --     --    info = "DiagnosticFloatingInfo",
  --     --    hint = "DiagnosticFloatingHint",
  --     -- },
  --     -- format = function(diagnostic)
  --     --    return diagnostic.message
  --     -- end,
  --     -- gap_size = 1,
  --     scope = 'line',    -- 'cursor', 'line' this changes the scope, so instead of showing errors under the cursor, it shows errors on the entire line.
  --     padding_top = 2,
  --     -- padding_right = 2,
  --     -- text_align = 'right',                             -- 'left', 'right'
  --     -- placement = 'top',                                -- 'top', 'inline'
  --     -- inline_padding_left = 0,                          -- the padding left when the placement is inline
  --     -- update_event = { 'DiagnosticChanged', 'BufReadPost' }, -- the event that updates the diagnostics cache
  --     -- toggle_event = {},                                -- if InsertEnter, can toggle the diagnostics on inserts
  --     -- show_sign = false,                                -- set to true if you want to render the diagnostic sign before the diagnostic message
  --     -- render_event = { 'DiagnosticChanged', 'CursorMoved' },
  --     -- border_chars = {
  --     --    top_left = "┌",
  --     --    top_right = "┐",
  --     --    bottom_left = "└",
  --     --    bottom_right = "┘",
  --     --    horizontal = "─",
  --     --    vertical = "│"
  --     -- },
  --     show_borders = true,
  --   }
  -- }
}
