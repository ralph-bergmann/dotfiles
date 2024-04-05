return {
   'stevearc/oil.nvim',
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("oil").setup({
         -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
         delete_to_trash = true,
         lsp_file_methods = {
            -- Set to true to autosave buffers that are updated with LSP willRenameFiles
            -- Set to "unmodified" to only save unmodified buffers
            autosave_changes = true,
         },
         view_options = {
            show_hidden = true,
            -- This function defines what will never be shown, even when `show_hidden` is set
            is_always_hidden = function(name, _)
               return name == '.DS_Store'
            end,
         },
      })
   end
}
