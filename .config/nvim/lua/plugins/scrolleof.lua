return {
   'Aasim-A/scrollEOF.nvim',
   event = { 'CursorMoved', 'WinScrolled' },
   config = function()
      require('scrollEOF').setup({
         -- Whether or not scrollEOF should be enabled in insert mode
         insert_mode = true,
      })
   end
}
