return {
	"danymat/neogen",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- Uncomment next line if you want to follow only stable versions
	version = "*",

	config = function()
		require("neogen").setup({
			enabled = true, --if you want to disable Neogen
			snippet_engine = "luasnip",
			input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
			languages = {
				lua = {
					template = {
						annotation_convention = "ldoc",
						-- annotation_convention = "emmylua"
					},
				},
				c = {
					template = {
						annotation_convention = "doxygen",
					},
				},
			},
		})

		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "<Leader>nf", function()
			require("neogen").generate({

				type = "func", -- Currently supported: func, class, type, file
			})
		end, opts)

		vim.keymap.set("n", "<Leader>nt", function()
			require("neogen").generate({

				type = "type", -- Currently supported: func, class, type, file
			})
		end, opts)

		vim.keymap.set("n", "<Leader>nc", function()
			require("neogen").generate({

				type = "class", -- Currently supported: func, class, type, file
			})
		end, opts)

		-- vim.keymap.set("n", "<Leader>nff", function()
		-- 	require("neogen").generate({

		-- 		type = "file", -- Currently supported: func, class, type, file
		-- 	}
		-- )
		-- end, opts)
	end,
}
