-- Neovim Configuration
-- Migrated from init.vim to Lua

-- Compatibility shim for Neovim 0.11+ (ft_to_lang was removed)
if not vim.treesitter.language.get_lang then
  vim.treesitter.language.get_lang = vim.treesitter.language.ft_to_lang
elseif not vim.treesitter.language.ft_to_lang then
  vim.treesitter.language.ft_to_lang = vim.treesitter.language.get_lang
end

-- Set leader key before loading plugins
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Load plugins (lazy.nvim)
require("plugins")
