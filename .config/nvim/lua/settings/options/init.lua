local set = vim.opt

set.shell = "/usr/bin/fish"

set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = true
set.breakindent = true
set.scrolloff = 5
set.fileencoding = "utf-8"
set.conceallevel = 2

set.number = true
set.relativenumber = false
set.cursorline = true
set.wildmenu = true
set.completeopt = "menuone,noselect"

set.hidden = true
set.mouse = "a"

set.autoindent = true
set.filetype.indent = false

set.clipboard = "unnamedplus"
set.laststatus = 3

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
})

vim.notify = require("notify")
