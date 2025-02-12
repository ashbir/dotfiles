-- Filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tcl",
    callback = function()
        vim.bo.autoindent = false
        vim.bo.smartindent = false
        vim.bo.indentexpr = ""
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = true
    end,
})

-- Set filetype for Verilog File
-- This is needed because sometime the file didn't detect as verilog filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.v",
    callback = function()
        vim.bo.filetype = "verilog"
    end,
})
