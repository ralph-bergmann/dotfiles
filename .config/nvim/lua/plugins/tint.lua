return {
  'levouh/tint.nvim',
  config = function()
    require("tint").setup({
      tint = -8,                     -- Darken colors, use a positive value to brighten
      saturation = 1.0,              -- Saturation to preserve
      tint_background_colors = true, -- Tint background portions of highlight groups
    })
  end

}
