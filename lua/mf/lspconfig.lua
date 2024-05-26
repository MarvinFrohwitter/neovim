local on_attach = require("mf.lspconfig_configuration").on_attach
local capabilities = require("mf.lspconfig_configuration").capabilities
local flags = require("mf.lspconfig_configuration").flags
-------------- manual setuo servers conflict with setup_handlers (multiple instances of the setup is the problem)---------------
-- Get the servers from the lsp-installer

require("lspconfig")["jdtls"].setup({
	root_dir = require("lspconfig").util.root_pattern(".git", "pom.xml"),
	on_attach = on_attach,
	capabilities = capabilities,
	flags = flags,
})

-- require("lspconfig")["clangd"].setup({
-- 	on_attach = on_attach,
-- 	flags = flags,
-- 	capabilities = capabilities,
-- })

-- require("lspconfig")["r_language_server"].setup({
-- 	on_attach = on_attach,
-- 	flags = flags,
-- 	capabilities = capabilities,
-- })


require("lspconfig")["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = flags,
	settings = {
		Lua = {
			runtime = {
				-- LuaJIT in the case of Neovim
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})
