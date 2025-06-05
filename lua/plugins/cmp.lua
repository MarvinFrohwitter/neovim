return {
	{
		lazy = false,
		"L3MON4D3/LuaSnip",
		version = "v2.*",

		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },

			-- {
			-- 	-- This breaks file saving in v0.11 and python snippets are broken as well.
			-- 	-- It is mostly redundant with friendly-snippets so is not needed in the future.
			-- 	"mireq/luasnip-snippets",
			-- 	init = function()
			-- 		require("luasnip_snippets.common.snip_utils").setup()
			-- 	end,
			-- },
		},
		init = function()
			require("luasnip").setup({

				-- Required to automatically include base snippets, like "c" snippets for "cpp"
				-- load_ft_func = require("luasnip_snippets.common.snip_utils").load_ft_func,
				-- ft_func = require("luasnip_snippets.common.snip_utils").ft_func,

				enable_autosnippets = true,
			})
		end,
	},

	{
		"iurimateus/luasnip-latex-snippets.nvim",
		dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
		ft = { "tex" },
		-- vimtex isn't required if using treesitter
		config = function()
			require("luasnip-latex-snippets").setup({ use_treesitter = true })
			require("luasnip").config.setup({ enable_autosnippets = true })
		end,
	},

	{
		"aspeddro/cmp-pandoc.nvim",
		ft = { "pandoc", "markdown", "rmd" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jbyuki/nabla.nvim", -- optional
		},
		config = function()
			require("cmp_pandoc").setup({
				filetypes = { "pandoc", "markdown", "rmd" },
				bibliography = {
					documentation = true,
					fields = { "type", "title", "author", "year" },
				},
				-- Crossref
				crossref = {
					documentation = true,
					-- Use nabla.nvim to render LaTeX equation to ASCII
					enable_nabla = true,
				},
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		-- Sources for nvim-cmp
		dependencies = {
			"rcarriga/cmp-dap",
			"onsails/lspkind.nvim",

			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"amarakon/nvim-cmp-buffer-lines",
			"rasulomaroff/cmp-bufname",

			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",

			-- "kdheepak/cmp-latex-symbols",
			"amarakon/nvim-cmp-lua-latex-symbols",

			"hrsh7th/cmp-emoji",

			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-calc",
			"uga-rosa/cmp-dictionary",
		},

		config = function()
			local status_luasnip, luasnip = pcall(require, "luasnip")
			if not status_luasnip then
				return
			end

			local status_cmp, cmp = pcall(require, "cmp")
			if not status_cmp then
				return
			end

			local status_lspkind, lspkind = pcall(require, "lspkind")
			if not status_lspkind then
				return
			end

			-- local function get_snippets_rtp()
			--   return vim.tbl_map(function(itm)
			--     return vim.fn.fnamemodify(itm, ":h")
			--   end, vim.api.nvim_get_runtime_file( "package.json", true
			--   ))
			-- end

			-- local opts = {
			--   paths = {
			--     vim.fn.stdpath('config')..'/snips/',
			--     get_snippets_rtp()[1],
			--   },
			-- }

			require("luasnip.loaders.from_vscode").lazy_load()

			-- Below is an example of extending snippets,
			-- in particular making JavaScript React available for JavaScript files:
			luasnip.filetype_extend("typescript", { "javascript" })

			-- That adds the typical comment snippets
			luasnip.filetype_extend("typescript", { "tsdoc" })
			luasnip.filetype_extend("javascript", { "jsdoc" })
			luasnip.filetype_extend("lua", { "luadoc" })
			-- luasnip.filetype_extend("python", { "pydoc" })
			luasnip.filetype_extend("rust", { "rustdoc" })
			luasnip.filetype_extend("cs", { "csharpdoc" })
			luasnip.filetype_extend("java", { "javadoc" })
			luasnip.filetype_extend("c", { "cdoc" })
			luasnip.filetype_extend("cpp", { "cppdoc" })
			luasnip.filetype_extend("php", { "phpdoc" })
			luasnip.filetype_extend("kotlin", { "kdoc" })
			luasnip.filetype_extend("ruby", { "rdoc" })
			luasnip.filetype_extend("sh", { "shelldoc" })

			local kind_icons = {
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				-- Constructor = "",
				Field = "",
				Variable = "",
				Class = "ﴯ",
				Interface = "",
				Module = "{}",
				Property = "ﰠ",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			}
			local cmp_kinds = {
				Text = "  ",
				Method = "  ",
				Function = "  ",
				Constructor = "  ",
				Field = "  ",
				Variable = "  ",
				Class = "  ",
				Interface = "  ",
				Module = "  ",
				Property = "  ",
				Unit = "  ",
				Value = "  ",
				Enum = "  ",
				Keyword = "  ",
				Snippet = "  ",
				Color = "  ",
				File = "  ",
				Reference = "  ",
				Folder = "  ",
				EnumMember = "  ",
				Constant = "  ",
				Struct = "  ",
				Event = "  ",
				Operator = "  ",
				TypeParameter = "  ",
			}

			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			cmp.setup({
				-- Don't autocomplete, otherwise there is too much clutter
				-- completion = {autocomplete = { false },},

				-- Don't preselect an option
				-- preselect = cmp.PreselectMode.None,
				preselect = cmp.PreselectMode.Item,

				-- Snippet engine, required
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				-- Mappings
				mapping = {
					-- open/close autocomplete
					["<C-Space>"] = function()
						if cmp.visible() then
							cmp.close()
						else
							cmp.complete()
						end
					end,

					["<C-c>"] = cmp.mapping.close(),

					-- select completion
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),

					["<Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end,

					["<S-Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end,

					-- Scroll documentation
					["<C-k>"] = cmp.mapping.scroll_docs(-4),
					["<C-j>"] = cmp.mapping.scroll_docs(4),
				},

				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},

				window = {
					completion = {
						border = "rounded",
						scrolloff = 5,
						-- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
						winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
						col_offset = 3,
						side_padding = 0,
						scrollbar = false,
					},
					documentation = {
						border = "rounded",
						scrolloff = 5,
						max_width = 100,
						-- max_height = 100,
						winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
						scrollbar = false,
					},
				},
				formatting = {

					format = lspkind.cmp_format({

						-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
						mode = "symbol", -- show only symbol annotations
						-- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						-- can also be a function to dynamically calculate max width such as
						maxwidth = function()
							return math.floor(0.45 * vim.o.columns)
						end,
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						show_labelDetails = true, -- show labelDetails in menu. Disabled by default

						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization.
						before = function(entry, vim_item)
							return vim_item
						end,
					}),

					-- without lspkind -------------------------------
					-- ====================================
					-- format = function(_, vim_item)
					-- 	vim_item.kind = (kind_icons[vim_item.kind] or "") .. " " .. vim_item.kind
					-- 	return vim_item
					-- end,
					-- ====================================
				},
				experimental = {
					ghost_text = true,
				},
				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				},
				-- Complete options from the LSP servers and the snippet engine
				sources = {
					{ name = "luasnip" },
					{
						name = "lazydev",
						group_index = 0, -- set group index to 0 to skip loading LuaLS completions
					},
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "render-markdown" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "cmp_pandoc" },
					{
						name = "buffer-lines",
						option = {
							words = false,
							comments = false,
							line_numbers = false,
							line_number_separator = " ",
							leading_whitespace = false,
							max_indents = 5, -- default 0 all indents
							max_size = 100, -- Maximum file size (in kB) for which this plugin will be activated
						},
					},
					{
						name = "bufname",
						option = {
							current_buf_only = false,
							-- allows to configure what buffers to extract a filename from
							bufs = function()
								return vim.api.nvim_list_bufs()
							end,
							-- configure which entries you want to include in your completion:
							-- - you have to return a table of entries
							-- - empty string means skip that particular entry
							extractor = function(filename, full_path)
								return { filename:match("[^.]*") }
							end,
						},
					},
					-- { name = 'spell', options = {keep_all_entries = false } },
					{ name = "nvim_lsp_document_symbol" },
					-- { name = 'dictionary', keyword_length = 2, },

					{ name = "lua-latex-symbols", option = { cache = true } },

					-- other sources that uses the julia repl to generate
					-- {
					-- 	name = "latex_symbols",
					-- 	option = {
					-- 		-- 0 -- mixed Show the command and insert the symbol
					-- 		-- 1 -- julia Show and insert the symbol
					-- 		-- 2 -- latex Show and insert the command
					-- 		strategy = 0, -- mixed
					-- 	},
					-- },

					{ name = "emoji" },
					{ name = "calc" },
				},
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.recently_used,
						require("clangd_extensions.cmp_scores"),
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})
			-- `/` cmdline setup.
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
					{ name = "buffer-lines" },
				},
			})
			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})

			cmp.setup({
				enabled = function()
					return vim.api.nvim_get_option_value("buftype", { buf = 0 }) ~= "prompt"
						or require("cmp_dap").is_dap_buffer()
				end,
			})

			cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
				sources = {
					{ name = "dap" },
				},
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
			-- require("cmp_dictionary").setup({
			--   dic = {
			--     ["*"] = { "/usr/share/hunspell" },
			--     -- ["lua"] = "path/to/lua.dic",
			--     -- ["javascript,typescript"] = { "path/to/js.dic", "path/to/js2.dic" },
			--     -- filename = {
			--     -- 	["xmake.lua"] = { "path/to/xmake.dic", "path/to/lua.dic" },
			--     -- },
			--     -- filepath = {
			--     -- 	["%.tmux.*%.conf"] = "path/to/tmux.dic"
			--     -- },
			--     spelllang = {
			--       en = "/usr/share/hunspell/en_US-large.dic",
			--       de = "/usr/share/hunspell/de_DE.dic",
			--     },
			--   },
			--   -- The following are default values.
			--   exact = 2,
			--   first_case_insensitive = false,
			--   document = false,
			--   document_command = "wn %s -over",
			--   async = true,
			--   max_items = -1,
			--   capacity = 5,
			--   debug = false,
			-- })
		end,
	},
}
