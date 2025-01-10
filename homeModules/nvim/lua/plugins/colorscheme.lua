return {
    {
        "sonph/onehalf",
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/vim")
        end,
    },
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_background = "medium"
            vim.g.gruvbox_material_better_performance = 1
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
    {
        "/morhetz/gruvbox",
        lazy = false,
        name = "gruvbox",
        priority = 1000,
        config = function()
        end,
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
        end
    },
}
