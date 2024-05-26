local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

require("mason-null-ls").setup({
	ensure_installed = {
		-- Opt to list sources here, when available in mason.
	},
	automatic_installation = false,
	automatic_setup = true, -- Recommended, but optional
	handlers = {
		-- function() end, -- disables automatic setup of all null-ls sources
        -- you have to disable this line, if you want to use null-ls for
        -- setting up other sources than provided by mason.
		stylua = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.stylua)
		end,
		prettier = function(source_name, methods)
			if vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()):match(".*.md") then
				null_ls.setup({
					should_attach = function(bufnr)
						return not vim.api.nvim_buf_get_name(bufnr):match(".*.md")
					end,
				})
			else
				null_ls.register(null_ls.builtins.formatting.prettier)
			end
		end,

		shfmt = function(source_name, methods) -- custom logic
			require("mason-null-ls").default_setup(source_name, methods) -- to maintain default behavior
		end,
	},
})

-----------------------------------Deprecated----------------------------------
-- require("mason-null-ls").setup_handlers({
-- 	function(source_name, methods)
-- 		-- all sources with no handler get passed here
--
-- 		-- To keep the original functionality of `automatic_setup = true`,
-- 		-- please add the below.
-- 		require("mason-null-ls.automatic_setup")(source_name, methods)
-- 	end,
-- 	stylua = function(source_name, methods)
-- 		null_ls.register(null_ls.builtins.formatting.stylua)
-- 	end,
-- 	prettier = function(source_name, methods)
-- 		if vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()):match(".*.md") then
-- 			null_ls.setup({
-- 				should_attach = function(bufnr)
-- 					return not vim.api.nvim_buf_get_name(bufnr):match(".*.md")
-- 				end,
-- 			})
-- 		else
-- 			null_ls.register(null_ls.builtins.formatting.prettier)
-- 		end
-- 	end,
-- })

-- if you want to setup a source here that is not in Mason you have to
-- give a complete empty hander table or follow the handler description

-- will setup any installed and configured sources above
null_ls.setup({
	sources = {
		-- Anything not supported by mason.

		-- null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.eslint,
		-- null_ls.builtins.completion.spell,
	},
})
