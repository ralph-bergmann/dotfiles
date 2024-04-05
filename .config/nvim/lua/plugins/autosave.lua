return {
   "okuuva/auto-save.nvim",
   cmd = "ASToggle",
   event = { "InsertLeave", "TextChanged" },
   opts = {
      execution_message = { enabled = false },
      condition = function(buf)
         local fn = vim.fn
         local utils = require("auto-save.utils.data")

         -- don't save for `oil` file types
         if utils.not_in(fn.getbufvar(buf, "&filetype"), { 'oil' }) then
            return true
         end
         return false
      end
   },
}
