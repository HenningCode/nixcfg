local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP rename" })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "LSP format file" })
    vim.keymap.set("n", "<leader>i", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "LPS enable inlay hints" })

    -- Fzf-lua keymaps
    vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references,
        { desc = "LSP telescope open references" })

    -- turn off auto formatting
    vim.g.zig_fmt_autosave = 0
end
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "j-hui/fidget.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
    },
    lazy = false,
    opts = {
        inlay_hints = { enabled = true },
    },
    config = function()
        require("fidget").setup({})

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local cmp = require("cmp")

        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig.zls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig.nixd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "nixd" },
            settings = {
                nixd = {
                    nixpkgs = {
                        expr = "import <nixpkgs> {}",
                    },
                    formatting = {
                        command = { "alejandra" },
                    }
                }
            }
        })

        cmp.setup({
            window = {
                documentation = {
                    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
                },
                completion = {
                    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
                },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
            }, {
                { name = "buffer" },
            }),
        })
    end,
}
