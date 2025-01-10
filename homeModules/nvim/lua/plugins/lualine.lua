return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "archibate/lualine-time",
    },
    config = function()
        require("lualine").setup({
            options = {
                theme = 'auto',
                section_separators = '',
                component_separators = '',
            },
            sections = {
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 1,
                    },
                },
                lualine_x = {
                },
            },
        })
    end,
}
