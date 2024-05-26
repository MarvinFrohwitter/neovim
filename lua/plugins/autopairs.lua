return {
	-- Completing braces and quotes
	"windwp/nvim-autopairs",
	lazy = false,
	config = function()
		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt", "vim" },
			disable_in_macro = true, -- disable when recording or executing a macro
			disable_in_visualblock = false, -- disable when insert after visual block mode
			ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
			enable_moveright = true,
			enable_afterquote = true, -- add bracket pairs after quote
			enable_check_bracket_line = true, --- check bracket in same line
			check_ts = true,
			map_bs = true, -- map the <BS> key
			map_c_h = false, -- Map the <C-h> key to delete a pair
			map_c_w = false, -- map <c-w> to delete a pair if possible
		})

		local Rule = require("nvim-autopairs.rule")
		local npairs = require("nvim-autopairs")

		npairs.add_rule(Rule("$$", "$$", "tex"))

		-- you can use some built-in conditions

		-- local cond = require('nvim-autopairs.conds')
		-- print(vim.inspect(cond))

		npairs.add_rules(
			{
				Rule("$", "$", { "tex", "latex", "markdown" }),
				-- -- don't add a pair if the next character is %
				-- :with_pair(cond.not_after_regex("%%"))
				-- -- don't add a pair if  the previous character is xxx
				-- :with_pair(cond.not_before_regex("xxx", 3))
				-- -- don't move right when repeat character
				-- :with_move(cond.none())
				-- -- don't delete if the next character is xx
				-- :with_del(cond.not_after_regex("xx"))
				-- -- disable adding a newline when you press <cr>
				-- :with_cr(cond.none())
			}
			-- disable for .vim files, but it work for another filetypes
			-- Rule("a","a","-vim")
		)

		-- npairs.add_rules({
		--   Rule("$$","$$","tex")
		--     :with_pair(function(opts)
		--         print(vim.inspect(opts))
		--         if opts.line=="aa $$" then
		--         -- don't add pair on that line
		--           return false
		--         end
		--     end)
		--    }
		-- )

		-- -- you can use regex
		-- -- press u1234 => u1234number
		-- npairs.add_rules({
		--     Rule("u%d%d%d%d$", "number", "lua")
		--       :use_regex(true)
		-- })

		-- -- press x1234 => x12341234
		-- npairs.add_rules({
		--     Rule("x%d%d%d%d$", "number", "lua")
		--       :use_regex(true)
		--       :replace_endpair(function(opts)
		--           -- print(vim.inspect(opts))
		--           return opts.prev_char:sub(#opts.prev_char - 3,#opts.prev_char)
		--       end)
		-- })

		-- -- you can do anything with regex +special key
		-- -- example press tab to uppercase text:
		-- -- press b1234s<tab> => B1234S1234S

		-- npairs.add_rules({
		--   Rule("b%d%d%d%d%w$", "", "vim")
		--     :use_regex(true,"<tab>")
		--     :replace_endpair(function(opts)
		--           return
		--               opts.prev_char:sub(#opts.prev_char - 4,#opts.prev_char)
		--               .."<esc>viwU"
		--     end)
		-- })

		-- -- you can exclude filetypes
		-- npairs.add_rule(
		--   Rule("$$","$$")
		--     :with_pair(cond.not_filetypes({"lua"}))
		-- )
	end,
}
