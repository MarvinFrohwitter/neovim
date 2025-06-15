return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter" },
	},

	config = function()
		require("lspsaga").setup({
			preview = {
				lines_above = 0,
				lines_below = 1,
			},
			scroll_preview = {
				scroll_down = "<C-d>",
				scroll_up = "<C-u>",
			},
			request_timeout = 2000,

			ui = {
				-- This option only works in Neovim 0.9
				title = true,
				-- Border type can be single, double, rounded, solid, shadow.
				border = "rounded",
				winblend = 0,
				expand = "",
				collapse = "",
				code_action = "💡",
				incoming = " ",
				outgoing = " ",
				hover = " ",
				kind = {},
			},

			outline = {
				win_position = "right",
				win_with = "",
				win_width = 30,
				preview_width = 0.4,
				show_detail = true,
				auto_preview = true,
				auto_refresh = true,
				auto_close = true,
				auto_resize = false,
				custom_sort = nil,
				keys = {
					expand_or_jump = "o",
					quit = "q",
				},
			},

			finder = {
				max_height = 0.5,
				min_width = 30,
				force_max_height = false,
				keys = {
					jump_to = "p",
					expand_or_jump = "o",
					vsplit = "s",
					split = "i",
					tabe = "t",
					tabnew = "r",
					quit = { "q", "<ESC>" },
					close_in_preview = "<ESC>",
				},
			},

			definition = {
				edit = "<C-c>o",
				vsplit = "<C-c>v",
				split = "<C-c>i",
				tabe = "<C-c>t",
				quit = { "q", "<ESC>" },
			},

			code_action = {
				num_shortcut = true,
				show_server_name = true,
				extend_gitsigns = true,
				keys = {
					-- string | table type
					quit = { "q", "<ESC>" },
					exec = "<CR>",
				},
			},

			lightbulb = {
				enable = false,
				enable_in_insert = false,
				sign = true,
				sign_priority = 40,
				virtual_text = true,
			},
			hover = {
				max_width = 0.6,
				open_link = "gx",
				open_browser = "!brave",
			},

			diagnostic = {
				on_insert = false,
				on_insert_follow = false,
				insert_winblend = 0,
				show_code_action = true,
				show_source = true,
				jump_num_shortcut = true,
				max_width = 0.7,
				max_height = 0.6,
				max_show_width = 0.9,
				max_show_height = 0.6,
				text_hl_follow = true,
				border_follow = true,
				extend_relatedInformation = false,
				keys = {
					exec_action = "o",
					quit = { "q", "<ESC>" },
					expand_or_jump = "<CR>",
					quit_in_show = { "q", "<ESC>" },
				},
			},

			rename = {
				quit = { "<C-c>", "q", "<ESC>" },
				exec = "<CR>",
				mark = "x",
				confirm = "<CR>",
				in_select = true,
			},

			callhierarchy = {
				show_detail = false,
				keys = {
					edit = "e",
					vsplit = "s",
					split = "i",
					tabe = "t",
					jump = "o",
					quit = { "<C-c>", "q", "<ESC>" },
					expand_collapse = "u",
				},
			},
			symbol_in_winbar = {
				enable = false,
				separator = " ",
				ignore_patterns = {},
				hide_keyword = true,
				show_file = true,
				folder_level = 2,
				respect_root = false,
				color_mode = true,
			},
			beacon = {
				enable = true,
				frequency = 7,
			},
		})

		-------- KEYMAPS FOR LSPSAGA --------------------------------------------------
		-- LSP finder - Find the symbol's definition
		-- If there is no definition, it will instead be hidden
		-- When you use an action in finder like "open vsplit",
		-- you can use <C-t> to jump back
		vim.keymap.set("n", "<leader>gh", "<cmd>Lspsaga finder<CR>")

		-- Code action
		-- vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

		-- Rename all occurrences of the hovered word for the entire file
		-- vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")

		-- Rename all occurrences of the hovered word for the selected files
		-- vim.keymap.set("n", "<leader><leader>gr", "<cmd>Lspsaga rename ++project<CR>")

		-- Peek definition
		-- You can edit the file containing the definition in the floating window
		-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
		-- It also supports tagstack
		-- Use <C-t> to jump back
		vim.keymap.set("n", "<leader>gp", "<cmd>Lspsaga peek_definition<CR>")

		-- Go to definition
		-- vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

		-- Peek type definition
		-- You can edit the file containing the type definition in the floating window
		-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
		-- It also supports tagstack
		-- Use <C-t> to jump back
		vim.keymap.set("n", "<leader>gP", "<cmd>Lspsaga peek_type_definition<CR>")

		-- Go to type definition
		vim.keymap.set("n", "<leader>gt", "<cmd>Lspsaga goto_type_definition<CR>")

		-- Show line diagnostics
		-- You can pass argument ++unfocus to
		-- unfocus the show_line_diagnostics floating window
		vim.keymap.set("n", "<leader><leader>k", "<cmd>Lspsaga show_line_diagnostics ++unfocus<CR>")

		-- Show buffer diagnostics
		vim.keymap.set("n", "<leader><leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

		-- Show workspace diagnostics
		vim.keymap.set("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

		-- Show cursor diagnostics
		vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics ++unfocus<CR>")

		-- Diagnostic jump
		-- You can use <C-o> to jump back to your previous location
		vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
		vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

		-- Diagnostic jump with filters such as only jumping to an error
		vim.keymap.set("n", "[E", function()
			require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end)
		vim.keymap.set("n", "]E", function()
			require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
		end)

		-- Toggle outline
		vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

		-- Hover Doc
		-- If there is no hover doc,
		-- there will be a notification stating that
		-- there is no information available.
		-- To disable it just use ":Lspsaga hover_doc ++quiet"
		-- Pressing the key twice will enter the hover window

		-- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")

		-- If you want to keep the hover window in the top right hand corner,
		-- you can pass the ++keep argument
		-- Note that if you use hover with ++keep, pressing this key again will
		-- close the hover window. If you want to jump to the hover window
		-- you should use the wincmd command "<C-w>w"
		-- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

		-- Call hierarchy
		-- vim.keymap.set("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
		-- vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

		-- Floating terminal
		-- vim.keymap.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
	end,
}
