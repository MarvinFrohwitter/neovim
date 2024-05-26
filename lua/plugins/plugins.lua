return {

	-- information for development with K
	"folke/neodev.nvim",

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	"nvimtools/none-ls.nvim",
	"nvim-lua/plenary.nvim",
	{ "jay-babu/mason-null-ls.nvim" },
	{ "jayp0521/mason-nvim-dap.nvim" },

	-- debugging with the dap
	{ "mfussenegger/nvim-dap", lazy = true },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {

			"nvim-neotest/nvim-nio",

			"mfussenegger/nvim-dap",
			lazy = true,
		},
		lazy = true,
	},
	{ "thehamsta/nvim-dap-virtual-text", lazy = true },

	-- git commands
	-- "kdheepak/lazygit.nvim",
	-- "tpope/vim-fugitive",

	-- {
	-- 	"smjonas/inc-rename.nvim",
	-- 	config = function()
	-- 		require("inc_rename").setup({
	-- 			input_buffer_type = "dressing",
	-- 		})
	-- 	end,
	-- 	lazy = false,
	-- },

	-- Other usefull plugins
	{
		"preservim/vim-pencil",
		event = "VeryLazy",
	},
	{
		"wellle/targets.vim",
		event = "VeryLazy",
	},
	{
		"godlygeek/tabular",
		event = "VeryLazy",
	},
	-- {
	-- 	"tpope/vim-sleuth",
	-- 	-- event = "VimEnter",
	-- 	lazy = false,
	-- },

	-- {
	-- 	"echasnovski/mini.align",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("mini.align").setup()
	-- 	end,
	-- },

	--------------------------------------------------------------------
	--  ____  _             _             _          _                --
	-- |  _ \| |_   _  __ _(_)_ __  ___  | |_ ___   | |_ _ __ _   _   --
	-- | |_) | | | | |/ _` | | '_ \/ __| | __/ _ \  | __| '__| | | |  --
	-- |  __/| | |_| | (_| | | | | \__ \ | || (_) | | |_| |  | |_| |  --
	-- |_|   |_|\__,_|\__, |_|_| |_|___/  \__\___/   \__|_|   \__, |  --
	--                |___/                                   |___/   --
	--------------------------------------------------------------------
	-- "nvim-neotest/neotest",

	-- { "junegunn/vim-easy-align", lazy = false },
	--------------------------------------------------------------------
}
