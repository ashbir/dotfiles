
local map = vim.api.nvim_set_keymap

map("i", "<C-d>", "copilot#Accept()", {expr = true, silent = true, noremap = false})
map("i", "<C-w>", "copilot#Next()", {expr = true, silent = true, noremap = false})
map("i", "<C-s>", "copilot#Previous()", {expr = true, silent = true, noremap = false})

vim.g.copilot_not_tab_map = true
