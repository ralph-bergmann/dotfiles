local opt = vim.opt

opt.number = true                   -- show line numbers
opt.relativenumber = true           -- show relative line numbers
opt.cursorline = true               -- highlight the current cursor line
opt.signcolumn = "yes"              -- always show sign column

opt.termguicolors = true            -- enable true color support
opt.background = "dark"             -- set background to dark

opt.tabstop = 3                     -- number of spaces a tab counts for
opt.shiftwidth = 3                  -- number of spaces to use for autoindent
opt.expandtab = true                -- convert tabs to spaces
opt.smartindent = true              -- autoindent new lines
opt.autoindent = true               -- autoindent new lines

opt.ignorecase = true               -- ignore case when searching
opt.smartcase = true                -- ignore case when searching, unless a capital letter is used

opt.backspace = "indent,eol,start"  -- allow backspace on indent, end of line or insert mode start position
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.iskeyword:append("-")           -- consider string-string as whole word
vim.g.mapleader = " "               -- set leader key to space

opt.scrolloff = 5                   -- minimal number of lines above and below the cursor


-- Navigate vim panes better
local keymap = vim.keymap
-- done in tmux-navigator.lua
-- keymap.set("n", "<c-j>", "<c-w>j", { desc = "move to window below (vim-options.lua)" })
-- keymap.set("n", "<c-k>", "<c-w>k", { desc = "move to window above (vim-options.lua)" })
-- keymap.set("n", "<c-h>", "<c-w>h", { desc = "move to window left (vim-options.lua)" })
-- keymap.set("n", "<c-l>", "<c-w>l", { desc = "move to window right (vim-options.lua)" })

keymap.set("n", "<leader>cs", "<cmd>nohl<CR>", { desc = "clear search highlights" })
