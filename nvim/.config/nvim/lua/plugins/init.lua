return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require("configs.conform"),
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    },

    {
        "nvimtools/none-ls.nvim",
        ft = { "python" },
        config = function()
            require("configs.null-ls")
        end,
    },

    {
        "github/copilot.vim",
        config = function()
            require("configs.copilot")
        end,
        lazy = false,
    },

    {
        "lervag/vimtex",
        ft = { "tex" },
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_syntax_enabled = 0
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
            return require("configs.nvim-treesitter")
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = true,
        lazy = false,
    },

    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        config = function()
            return require("configs.mason")
        end,
    },
    {
        "nat-418/tcl.nvim",
        ft = { "tcl" },
    },
}
