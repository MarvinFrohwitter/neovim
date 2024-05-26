local on_attach = require("mf.lspconfig_configuration").on_attach
local capabilities = require("mf.lspconfig_configuration").capabilities
local flags = require("mf.lspconfig_configuration").flags

-- where your installed servers are setup "automatically" you can do the following
local handlers = {
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = flags,
		})
	end,

	-- ["r_language_server"] = function()
	-- 	local lspconfig = require("lspconfig")
	-- 	lspconfig.r_language_server.setup({
	-- 		on_attach = on_attach,
	-- 		capabilities = capabilities,
	-- 	})
	-- end,

	-- ["ocamllsp"] = function()
	-- 	local lspconfig = require("lspconfig")
	-- 	lspconfig.ocamllsp.setup({
	-- 		on_attach = on_attach,
	-- 		capabilities = capabilities,
	-- 	})
	-- end,

	-- ["lua_ls"] = function()
	-- 	local lspconfig = require("lspconfig")
	-- 	lspconfig.lua_ls.setup({
	-- 		settings = {
	-- 			Lua = {
	-- 				diagnostics = {
	-- 					globals = { "vim" },
	-- 				},
	-- 			},
	-- 		},
	-- 	})
	-- end,
}
-- require("mason-lspconfig").setup_handlers({
-- 	-- The first entry (without a key) will be the default handler
-- 	-- and will be called for each installed server that doesn't have
-- 	-- a dedicated handler.

-- 	function(server_name) -- default handler (optional)
-- 		require("lspconfig")[server_name].setup({
-- 			on_attach = on_attach,
-- 			capabilities = capabilities,
-- 			flags = flags,
-- 		})
-- 	end,

-- 	-- Next, you can provide targeted overrides for specific servers.
-- 	--------------------------------------------------------------
-- 	---This thing is broken just override by lspconfig directly---
-- 	--------------------------------------------------------------

-- 	-- ["lua_ls"] = function()
-- 	-- 	require("lspconfig")["lua_ls"].setup({
-- 	--        })
-- 	--    end,

-- 	-- ["clangd"] = function()
-- 	-- 	require("lspconfig")["clangd"].setup({

-- 	-- 		capabilities = function()
-- 	-- 			local c = vim.lsp.protocol.make_client_capabilities()
-- 	-- 			c.textDocument.completion.completionItem.snippetSupport = true
-- 	-- 			c.textDocument.documentHighlight.dynamicRegistration = true
-- 	-- 			c = require("cmp_nvim_lsp").default_capabilities(capabilities)
-- 	-- 			return c
-- 	-- 		end,
-- 	-- 		capabilities = false,
-- 	-- 		settings = {
-- 	-- 			clangd = 0,
-- 	-- 		},
-- 	-- 	})
-- 	-- end,

-- 	-- ["rust_analyzer"] = function()
-- 	-- 	require("lspconfig")["rust_analyzer"].setup({
-- 	-- 		settings = {},
-- 	-- 	})
-- 	-- end,
-- 	-- ["lua_ls"] = function()
-- 	-- 	require("lspconfig")["lua_ls"].setup({
-- 	-- 		settings = {
-- 	-- 			Lua = {
-- 	-- 			runtime = {
-- 	-- 				-- LuaJIT in the case of Neovim
-- 	-- 				version = "LuaJIT",
-- 	-- 				path = vim.split(package.path, ";"),
-- 	-- 			},
-- 	-- 				diagnostics = {
-- 	-- 					-- Get the language server to recognize the `vim` global
-- 	-- 					globals = { "vim" },
-- 	-- 				},
-- 	-- 				workspace = {
-- 	-- 					checkThirdParty = false,
-- 	-- 					-- Make the server aware of Neovim runtime files
-- 	-- 					library = {
-- 	-- 						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 	-- 						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
-- 	-- 					},
-- 	-- 				},
-- 	-- 			},
-- 	-- 		},
-- 	-- 	})
-- 	-- end,
-- })

require("mason-lspconfig").setup({
	-- ensure_installed = { "sumneko_lua", "jdtls" },
	handlers = handlers,
})
