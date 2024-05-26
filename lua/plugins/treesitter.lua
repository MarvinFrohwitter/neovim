return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	dependencies = {
		{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = false },
		{ "nvim-treesitter/nvim-treesitter-context",     lazy = false },
		{ "mfussenegger/nvim-treehopper",                lazy = false },
		{ "nvim-treesitter/nvim-treesitter-textobjects", lazy = false },
		{ "p00f/nvim-ts-rainbow",                        lazy = false },
	},

	config = function()
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		configs.setup({
			-- one of "all", "maintained" (parsers with maintainers), or a list of languages
			ensure_installed = "all",
			-- install languages synchronously (only applied to `ensure_installed`)
			sync_install = true,
			-- List of parsers to ignore installin
			gignore_install = { "" },
			autopairs = {
				enable = true,
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "" }, -- list of language that will be disabled
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			textobjects = {
				lsp_interop = {
					enable = true,
					border = "rounded",
					floating_preview_opts = {},
					peek_definition_code = {
						["<leader>df"] = "@function.outer",
						["<leader>dF"] = "@class.outer",
					},
				},
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@function.outer",
						["ic"] = "@function.inner",
					},
					include_surrounding_whitespace = true,
				},
			},
			rainbow = {
				enable = true,
				--list of languages you want to disable the plugin for
				-- disable = { "jsx", "cpp" },
				-- Also highlight non-bracket delimiters like html tags.
				extended_mode = true,
				-- Do not enable for files with more than n lines, int
				max_file_lines = nil,
				-- colors = {}, -- table of hex strings
				-- termcolors = {} -- table of colour name strings
			},

			-- Is depricated now built in
			-- playground = {
			-- 	enable = true,
			-- 	disable = {},
			-- 	updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			-- 	persist_queries = false, -- Whether the query persists across vim sessions
			-- 	keybindings = {
			-- 		toggle_query_editor = "o",
			-- 		toggle_hl_groups = "i",
			-- 		toggle_injected_languages = "t",
			-- 		toggle_anonymous_nodes = "a",
			-- 		toggle_language_display = "I",
			-- 		focus_language = "f",
			-- 		unfocus_language = "F",
			-- 		update = "R",
			-- 		goto_node = "<cr>",
			-- 		show_help = "?",
			-- 	},
			-- },

			indent = { enable = true, disable = { "yaml" } },
			-- context_commentstring = {
			-- 	enable = true,
			-- 	enable_autocmd = false,
			-- },
		})
		require("ts_context_commentstring").setup()
		vim.g.skip_ts_context_commentstring_module = true
	end,
}
