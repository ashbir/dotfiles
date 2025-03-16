-- source: https://gist.github.com/rajeakshay/d6ebe2a8ec23055dfd92d884df52aee1
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set clipboard to global clipboard
vim.opt.clipboard:append("unnamedplus")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {
        continue = true,
        modes = {
          search = {
            enabled = true
          },
          char = {
            jump_labels = true
          },
        }
      },
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      },
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  },
  -- Configure any other settings here. See the documentation for more details.
  -- Colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("neovim.highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- Key Bindings
vim.keymap.set({ "n", "x" }, "<leader>c", '"+y')
vim.keymap.set({ "n", "x" }, "<leader>v", '"+p')
vim.keymap.set({ "n", "x" }, "<leader>V", '"+P')
