dofile(vim.g.base46_cache .. "mason")

require("mason").setup({
    PATH = "skip",

    ui = {
        icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
        },
    },

    max_concurrent_installers = 10,

    ensure_installed = {
        "pyright",
        "ruff",
        "texlab",
        "matlab_ls",
        "verible",
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",
        "ruff",
        "texlab",
        "matlab_ls",
        "verible",
    },
})

require("mason-tool-installer").setup({
    ensure_installed = {
        "mypy",
    },
})
