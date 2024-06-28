return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "go" })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                gopls = {},
            },
        },
    },
}
