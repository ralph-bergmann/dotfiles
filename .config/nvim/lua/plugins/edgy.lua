return {
   "folke/edgy.nvim",
   event = "VeryLazy",
   init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
   end,
   opts = {
      left = {
         {
            title = "Neo-Tree",
            ft = "neo-tree",
            filter = function(buf)
               return vim.b[buf].neo_tree_source == "filesystem"
            end,
            pinned = true,
            size = { height = 0.6 },
         },
         {
            ft = "Outline",
            pinned = true,
            open = "OutlineOpen",
            size = { height = 0.4 },
         },
         -- {
         -- 	title = "Git Status",
         -- 	ft = "neo-tree",
         -- 	filter = function(buf)
         -- 		return vim.b[buf].neo_tree_source == "git_status"
         -- 	end,
         -- 	pinned = true,
         -- 	open = "Neotree position=right git_status",
         -- 	size = { height = 0.3 },
         -- },
         -- {
         -- 	title = "Neo-Tree Buffers",
         -- 	ft = "neo-tree",
         -- 	filter = function(buf)
         -- 		return vim.b[buf].neo_tree_source == "buffers"
         -- 	end,
         -- 	pinned = true,
         -- 	open = "Neotree position=top buffers",
         -- },
      },
   },
}
