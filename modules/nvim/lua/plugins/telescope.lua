return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
                pickers = {
                    colorscheme = {
                        enable_preview = true
                    }
                },
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = require("telescope.actions").close,
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
            vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
            vim.keymap.set("n", "<leader>fc", require("telescope.builtin").colorscheme, {})

            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("smart_open")
        end,
    },
    {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        config = function()
            vim.keymap.set("n", "<leader>ff", function()
                require("telescope").extensions.smart_open.smart_open({
                    cwd_only = true,
                    filename_first = false
                })
            end, { noremap = true, silent = true })
        end,
        dependencies = {
            "kkharji/sqlite.lua",
        },
    },
}
