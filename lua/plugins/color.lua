return {
	-- Color for Hexcodes
	"norcalli/nvim-colorizer.lua",
    lazy = false,
	config = function()

		local status_ok, colorizer = pcall(require, "colorizer")
		if not status_ok then
			return
		end

		-- Attach to certain Filetypes
		-- Exclude some filetypes from highlighting by using `!`
		colorizer.setup({ "*", "!vim" }, {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = false, -- "Name" codes like Blue oe blue
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			-- Available modes: foreground, background, virtualtext
			mode = "background", -- Set the display mode.
		})
	end,
}
