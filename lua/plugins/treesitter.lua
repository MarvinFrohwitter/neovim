return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	branch = "main",
	dependencies = {
		{ "HiPhish/rainbow-delimiters.nvim", lazy = false },
		{ "mfussenegger/nvim-treehopper", lazy = false },
		{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = false },
	},

	config = function()
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		require("nvim-treesitter").setup({
			-- A list of parser names or tiers ('stable', 'unstable')
			-- ensure_install = { "stable" },

			-- Directory to install parsers and queries to
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- configs.setup({
		-- 	-- one of "all", "maintained" (parsers with maintainers), or a list of languages
		-- ensure_installed = "all",
		-- install languages synchronously (only applied to `ensure_installed`)
		-- 	sync_install = true,
		-- 	gignore_install = { "" },
		-- 	autopairs = {
		-- 		enable = true,
		-- 	},
		-- 	highlight = {
		-- 		enable = true, -- false will disable the whole extension
		-- 		disable = { "" }, -- list of language that will be disabled
		-- 		additional_vim_regex_highlighting = true,
		-- 	},
		-- 	incremental_selection = {
		-- 		enable = true,
		-- 		keymaps = {
		-- 			init_selection = "gnn", -- set to `false` to disable one of the mappings
		-- 			node_incremental = "grn",
		-- 			scope_incremental = "grc",
		-- 			node_decremental = "grm",
		-- 		},
		-- 	},
		-- 	textobjects = {
		-- 		lsp_interop = {
		-- 			enable = true,
		-- 			border = "rounded",
		-- 			floating_preview_opts = {},
		-- 			peek_definition_code = {
		-- 				["<leader>df"] = "@function.outer",
		-- 				["<leader>dF"] = "@class.outer",
		-- 			},
		-- 		},
		-- 		select = {
		-- 			enable = true,
		-- 			lookahead = true,
		-- 			keymaps = {
		-- 				["af"] = "@function.outer",
		-- 				["if"] = "@function.inner",
		-- 				["ac"] = "@function.outer",
		-- 				["ic"] = "@function.inner",
		-- 			},
		-- 			include_surrounding_whitespace = true,
		-- 		},
		-- 	},
		-- 	indent = { enable = true, disable = { "yaml" } },
		-- })
		require("ts_context_commentstring").setup()
		vim.g.skip_ts_context_commentstring_module = true
		require("rainbow-delimiters.setup").setup({})
	end,
}
