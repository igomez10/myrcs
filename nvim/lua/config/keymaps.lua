-- Key Mappings

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable q (was set to <Nop>)
map("", "q", "<Nop>", opts)

-- Window navigation
map("n", "<C-J>", "<C-W><C-J>", opts)
map("n", "<C-K>", "<C-W><C-K>", opts)
map("n", "<C-L>", "<C-W><C-L>", opts)
map("n", "<C-H>", "<C-W><C-H>", opts)

-- Save file
map("n", "<leader>w", ":w<CR>", opts)

-- Exit insert mode
map("i", "jj", "<Esc>", opts)

-- Quickfix
map("n", "<leader>a", ":cclose<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Search: center on found line
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Clear search highlighting
map("n", "<leader>0", ":noh<CR>", opts)

-- Tab switching with numbers
for i = 1, 9 do
  map("n", tostring(i), i .. "gt", opts)
end

-- Yank to system clipboard
map("v", "<leader>y", '"+y', opts)

-- Keep selection when pasting in visual mode
map("x", "p", "pgvy", opts)

-- Star search without jumping
map("n", "*", "*``", opts)

-- Source config commands
vim.api.nvim_create_user_command("Sesource", ":split ~/.config/nvim/init.lua", {})
vim.api.nvim_create_user_command("Vesource", ":vsplit ~/.config/nvim/init.lua", {})
vim.api.nvim_create_user_command("SourceSource", ":source ~/.config/nvim/init.lua", {})

-- Convenience commands
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
vim.api.nvim_create_user_command("QA", "qa", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("W", "w", {})

-- Terminal commands
vim.api.nvim_create_user_command("T", function(cmd)
  vim.cmd("split | terminal " .. cmd.args)
end, { nargs = "*" })
vim.api.nvim_create_user_command("VT", function(cmd)
  vim.cmd("vsplit | terminal " .. cmd.args)
end, { nargs = "*" })
vim.api.nvim_create_user_command("TT", function(cmd)
  vim.cmd("tabnew | terminal " .. cmd.args)
end, { nargs = "*" })

-- Command abbreviations
vim.cmd([[
  cabbrev tn tabnew
  cabbrev th tabp
  cabbrev tl tabn
  cabbrev vsb vertical sb
]])

-- LSP keymaps (will be set up in lsp.lua but defining fallbacks here)
-- These will be overridden by LSP on_attach
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
map("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "[g", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]g", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Telescope keymaps (will be loaded with telescope)
-- Placeholder - actual bindings in telescope.lua
