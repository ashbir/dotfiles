pcall(function()
    dofile(vim.g.base46_cache .. "syntax")
    dofile(vim.g.base46_cache .. "treesitter")
end)

return {
    ensure_installed = {
        "lua",
        "luadoc",
        "printf",
        "vim",
        "vimdoc",
        "python",
        "markdown",
        "toml",
        "latex",
        "yaml",
        "bash",
        "verilog",
        "bibtex",
        "matlab",
        "json",
        "tcl",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}
