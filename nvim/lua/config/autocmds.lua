-- Autocommands

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General settings
local general = augroup("General", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Auto-reload files changed outside vim
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = general,
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

-- Notify on file change
autocmd("FileChangedShellPost", {
  group = general,
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
  end,
})

-- Git commit settings
autocmd("FileType", {
  group = general,
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.bufhidden = "delete"
  end,
})

-- YAML settings
autocmd("FileType", {
  group = general,
  pattern = { "yaml", "yml" },
  callback = function()
    vim.opt_local.listchars = { tab = "|\\ " }
  end,
})

-- Quickfix window position
autocmd("FileType", {
  group = general,
  pattern = "qf",
  callback = function()
    vim.cmd("wincmd J")
  end,
})

-- Go settings
local go_group = augroup("GoSettings", { clear = true })

autocmd({ "BufNewFile", "BufRead" }, {
  group = go_group,
  pattern = "*.go",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Go-specific keymaps
autocmd("FileType", {
  group = go_group,
  pattern = "go",
  callback = function()
    local opts = { buffer = true, silent = true }
    -- These work with vim-go
    vim.keymap.set("n", "<leader>b", "<cmd>GoBuild<CR>", opts)
    vim.keymap.set("n", "<leader>t", "<Plug>(go-test)", opts)
    vim.keymap.set("n", "<leader>r", "<Plug>(go-run)", opts)
    vim.keymap.set("n", "<leader>d", "<Plug>(go-doc)", opts)
    vim.keymap.set("n", "<leader>c", "<Plug>(go-coverage-toggle)", opts)
    vim.keymap.set("n", "<leader>i", "<Plug>(go-info)", opts)
    vim.keymap.set("n", "<leader>l", ":GoLint<CR>", opts)
    vim.keymap.set("n", "<leader>v", "<Plug>(go-def-vertical)", opts)
    vim.keymap.set("n", "<leader>s", "<Plug>(go-def-split)", opts)
    vim.keymap.set("n", "<C-g>", ":GoDeclsDir<CR>", opts)

    -- GoAlternate commands
    vim.api.nvim_buf_create_user_command(0, "A", function()
      vim.fn["go#alternate#Switch"](0, "edit")
    end, { bang = true })
    vim.api.nvim_buf_create_user_command(0, "AV", function()
      vim.fn["go#alternate#Switch"](0, "vsplit")
    end, { bang = true })
    vim.api.nvim_buf_create_user_command(0, "AS", function()
      vim.fn["go#alternate#Switch"](0, "split")
    end, { bang = true })
    vim.api.nvim_buf_create_user_command(0, "AT", function()
      vim.fn["go#alternate#Switch"](0, "tabe")
    end, { bang = true })
  end,
})

-- Python settings
local python_group = augroup("PythonSettings", { clear = true })

autocmd("FileType", {
  group = python_group,
  pattern = "python",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Remove trailing whitespace on save (except for certain filetypes)
autocmd("BufWritePre", {
  group = general,
  pattern = "*",
  callback = function()
    local ft = vim.bo.filetype
    if ft ~= "markdown" and ft ~= "diff" then
      local save_cursor = vim.fn.getpos(".")
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.setpos(".", save_cursor)
    end
  end,
})
