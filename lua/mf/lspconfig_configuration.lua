local M = {}
M.on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- Mappings.
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- local opt = { noremap = true, silent = true, buffer = bufnr }

	-- vim.keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	-- vim.keymap.set("n", "<leader><leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.keymap.set("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.keymap.set("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "<leader>gr", "<cmd> Telescope lsp_references<CR>", opts)
	vim.keymap.set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	vim.keymap.set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	vim.keymap.set("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	vim.keymap.set({ "n", "v" }, "<leader><leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
	-- Set some keybinds conditional on server capabilities
	-- if client.resolved_capabilities.document_formatting then
	--   vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	-- elseif client.resolved_capabilities.document_range_formatting then
	--   vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	-- end
	-- Set autocommands conditional on server_capabilities

	-- if client.resolved_capabilities.document_highlight then
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
			    augroup lsp_document_highlight
			    autocmd! * <buffer>
			    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			    augroup END
		    ]],
			false
		)
	end

	-- If you enable this you have to disable the functionalitiy in barbecue
	-- if client.server_capabilities["documentSymbolProvider"] then
	-- 	require("nvim-navic").attach(client, bufnr)
	-- end

	vim.diagnostic.config({
		virtual_text = false,
		signs = true,
		underline = false,
	})
end

-- config that activates keymaps and enables snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.documentHighlight.dynamicRegistration = true
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.capabilities = capabilities

M.flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

return M
