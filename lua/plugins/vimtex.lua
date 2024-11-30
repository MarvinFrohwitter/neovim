return {
	-- LaTeX
	{
		"lervag/vimtex",
		ft = { "tex" },
		init = function()
			vim.g.vimtex_view_method = "zathura"
			-- vim.g.vimtex_view_general_viewer = "evince"
			-- vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
			-- vim.g.vimtex_compiler_method = "latexrun"
		end,
	},
	{
		"xuhdev/vim-latex-live-preview",
		ft = { "tex" },
		init = function()
			vim.g.livepreview_previewer = "zathura"
			vim.g.livepreview_engine = "pdflatex"
			vim.g.livepreview_use_biber = 1
		end,
	},
}
