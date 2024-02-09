-- automatically highlighting other uses of the word under the cursor
-- using either LSP, Tree-sitter, or regex matching.
return {
   "RRethy/vim-illuminate",
   config = function()
      require("illuminate").configure({
         providers = { "lsp" },
      })
   end,
}
