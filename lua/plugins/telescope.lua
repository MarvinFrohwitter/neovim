return {
	-- Telescope
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"debugloop/telescope-undo.nvim",
		"benfowler/telescope-luasnip.nvim",
		"nvim-telescope/telescope-dap.nvim",
		--fzf
		{ "nvim-telescope/telescope-fzf-native.nvim", lazy = false, build = "make" },
	},

	config = function()
		local actions = require("telescope.actions")
		-- local utils = require('telescope.utils')

		-- local open_with_trouble = require("trouble.sources.telescope").open
		-- Use this to add more results without clearing the trouble list
		local add_to_trouble = require("trouble.sources.telescope").add

		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-c>"] = actions.close,
						["<c-t>"] = add_to_trouble,
					},
					n = {
						["<C-c>"] = actions.close,
						["<c-t>"] = add_to_trouble,
					},
				},
				layout_config = {
					horizontal = {
						height = 47,
						prompt_position = "top",
					},
				},
			},
			extensions = {
				-- extensions = {
				-- 	aerial = {
				-- 		-- Display symbols as <root>.<parent>.<symbol>
				-- 		show_nesting = {
				-- 			["_"] = false, -- This key will be the default
				-- 			json = true, -- You can set the option for specific filetypes
				-- 			yaml = true,
				-- 		},
				-- 	},
				-- },
				undo = {
					use_delta = true,
					use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
					side_by_side = false,
					vim_diff_opts = {
						ctxlen = vim.o.scrolloff,
					},
					entry_format = "state #$ID, $STAT, $TIME",
					time_format = "",
					saved_only = false,
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("luasnip")
		-- require('telescope').load_extension('aerial')
		-- require("telescope").load_extension("lazygit")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("undo")
		require("telescope").load_extension("dap")
		require("telescope").load_extension("noice")
	end,
}
