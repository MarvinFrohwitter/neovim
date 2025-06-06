local config = require("mf.lspconfig_configuration")
local on_attach = config.on_attach
local capabilities = config.capabilities
local flags = config.flags
-------------- manual setuo servers conflict with setup_handlers (multiple instances of the setup is the problem)---------------
-- Get the servers from the lsp-installer

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities = vim.tbl_deep_extend(
            "force",
            capabilities,
            require("cmp_nvim_lsp").default_capabilities()
        )

        local opts = { buffer = event.buf }
        config.setup(event.buf)
    end,
})

-- require("lspconfig")["jdtls"].setup({
--     root_dir = require("lspconfig").util.root_pattern(".git", "pom.xml"),
--     on_attach = on_attach,
--     capabilities = capabilities,
--     flags = flags,
-- })

-- require("lspconfig")["clangd"].setup({
--     on_attach = on_attach,
--     flags = flags,
--     capabilities = capabilities,
-- })

-- require("lspconfig")["r_language_server"].setup({
--     on_attach = on_attach,
--     flags = flags,
--     capabilities = capabilities,
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
