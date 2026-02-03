-- Neovim Options

local opt = vim.opt

-- General
opt.compatible = false
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.timeoutlen = 1000
opt.ttimeoutlen = 1
opt.updatetime = 300

-- UI
opt.number = true
opt.cursorline = true
opt.showmatch = true
opt.showcmd = true
opt.showmode = false
opt.laststatus = 2
opt.signcolumn = "yes"
opt.cmdheight = 2
opt.pumheight = 10
opt.scrolloff = 5
opt.splitright = true
opt.splitbelow = true
opt.termguicolors = true

-- Tabs & Indentation
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.autoindent = true
opt.smartindent = true

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Files
opt.encoding = "utf-8"
opt.fileformats = { "unix", "dos", "mac" }
opt.autoread = true
opt.hidden = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Backspace behavior
opt.backspace = { "indent", "eol", "start" }

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shortmess:append("c")

-- Persistent undo
if vim.fn.has("persistent_undo") == 1 then
  opt.undofile = true
  opt.undodir = vim.fn.expand("~/.config/nvim/undo/")
  vim.fn.mkdir(vim.fn.expand("~/.config/nvim/undo/"), "p")
end

-- Wildmenu
opt.wildmenu = true
opt.path:append("**")

-- No bells
opt.errorbells = false

-- Python providers
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.python_host_prog = "/usr/bin/python"

-- Netrw settings (kept for fallback)
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3
