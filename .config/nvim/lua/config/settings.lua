vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable builtin plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_spec = 1

vim.opt.autowrite = true
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.incsearch = true
vim.opt.compatible = false
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.autoindent = true
vim.opt.smartcase = true -- improve searching using '/'
vim.opt.smartindent = true -- smarter indentation
vim.opt.smarttab = true -- make tab behaviour smarter
vim.opt.undofile = true
vim.opt.showmatch = true -- highlight matching [{()}]
vim.opt.showcmd = true -- disable mode display since lightline display
vim.opt.showmode = false -- don't show mode
vim.opt.backup = false -- disable backup
vim.opt.writebackup = false -- disable backup
vim.opt.cursorline = true -- enable cursorline
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.hidden = true -- keep hidden buffers
vim.opt.hlsearch = true -- highlight matching search
vim.opt.ignorecase = true -- case insensitive on search
vim.opt.list = true -- display listchars
vim.opt.number = true -- enable number
vim.opt.relativenumber = false -- enable relativenumber
vim.opt.swapfile = false -- disable swapfile
vim.opt.spell = false
vim.opt.encoding = "UTF-8" -- set encoding
vim.opt.mouse = "a" -- enable mouse support
vim.opt.signcolumn = "yes" -- enable sign column all the time, 4 column
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.shell = "fish" -- fish as shell
vim.opt.syntax = "on" -- syntax enable
vim.opt.undodir = "/tmp/"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.completeopt = "menuone,noselect"

-- vim.opt.listchars = {"eol:↲", "tab:»-", "extends:>", "precedes:<", "trail:·", "nbsp:␣ list"}
vim.opt.wildignore = {
	".git",
	"*.zip",
	"**/tmp/**",
	"*.DS_Store",
	"**/node_modules/**",
}
vim.opt.foldlevel = 6
vim.opt.laststatus = 2 -- always enable statusline
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- limit completion items
vim.opt.scrolloff = 5 -- make scrolling better
vim.opt.sidescroll = 2 -- make scrolling better
vim.opt.sidescrolloff = 8 -- make scrolling better
vim.opt.synmaxcol = 500 -- set limit for syntax highlighting in a single line
vim.opt.shiftround = true -- set indentation width
vim.opt.shiftwidth = 2 -- set indentation width
vim.opt.tabstop = 2 -- tabsize
vim.opt.softtabstop = 2

vim.g.vimruntime = false
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python3"

-- Check if we need to reload the file when it changed
vim.cmd "au FocusGained * :checktime"

-- show cursor line only in active window
vim.cmd [[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]]

-- go to last loc when opening a buffer
vim.cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]]

-- autocmds
vim.cmd "au TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup = 'IncSearch', timeout = 500, on_visual = true})"

vim.g.completion_trigger_character = { "." }
