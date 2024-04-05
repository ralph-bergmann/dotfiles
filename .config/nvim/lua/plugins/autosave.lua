return {
   "okuuva/auto-save.nvim",
   cmd = "ASToggle",
   event = { "InsertLeave", "TextChanged" },
   config = function()
      require("auto-save").setup({
         execution_message = { enabled = false },
         trigger_events = { "InsertLeave", "TextChanged" },
         condition = function(buf)
            local fn = vim.fn
            local utils = require("auto-save.utils.data")

            -- don't save for `oil` file types
            if utils.not_in(fn.getbufvar(buf, "&filetype"), { 'oil' }) then
               return true
            end
            return false
         end
      })
   end,
}
