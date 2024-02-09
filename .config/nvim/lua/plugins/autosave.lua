return {
	"okuuva/auto-save.nvim",
	cmd = "ASToggle", -- optional for lazy loading on command
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {},
	config = function()
		require("auto-save").setup({
			execution_message = {
				enabled = false,
			},
		})
	end,
}
