vim.loader.enable()

local cmd = vim.cmd
local opt = vim.o
local fn = vim.fn

-- leader
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- Remove netrw (neo-tree is enabled)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- Enable true color support
if fn.has('termguicolors') then
  opt.termguicolors = true
end


-- General
opt.showmode = false  -- remove the current mode (already in the lualine)
opt.number = true     -- display line numbers
opt.signcolumn = "number"
opt.lazyredraw = true -- redraw only when needed
opt.showmatch = true  -- highlight matching parentheses, etc
opt.wrap = false
opt.linebreak = true  -- wrap lines at convenient places
opt.hid = true        -- a buffer becomes hidden when abandoned
opt.foldenable = true
opt.history = 2000
opt.nrformats = 'bin,hex' -- 'octal'
opt.cmdheight = 1

-- Search
opt.incsearch = true          -- searches incrementally as you type instead of after 'enter'
opt.hlsearch = true
opt.path = vim.o.path .. '**' -- Search down into subfolders

-- Indentation
opt.autoindent = true
opt.cindent = true -- automatically indent braces
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

-- Scrolling
opt.scrolloff = 4 -- start scrolling when we are 4 lines away from margins
opt.sidescrolloff = 15
opt.sidescroll = 1

-- Splits
opt.splitright = true
opt.splitbelow = true

opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Configure Neovim diagnostic messages

vim.diagnostic.config {
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
}

-- Native plugins
cmd.filetype('plugin', 'indent', 'on')
cmd.packadd('cfilter') -- Allows filtering the quickfix list with :cfdo

-- let sqlite.lua (which some plugins depend on) know where to find sqlite
vim.g.sqlite_clib_path = require('luv').os_getenv('LIBSQLITE')
