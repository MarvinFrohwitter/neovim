return {

	-- Adding color in the lsp stuff
	"folke/lsp-colors.nvim",
	lazy = false,

	config = function()
		require("lsp-colors").setup({
			Error = "#db4b4b",
			Warning = "#e0af68",
			Information = "#0db9d7",
			Hint = "#10B981",
		})
	end,
}
