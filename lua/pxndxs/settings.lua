vim.g.mapleader = ' '

-- rule
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.numberwidth = 1

-- tabulation
vim.opt.expandtab   = true
vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 2
vim.opt.softtabstop = 2

-- indent
vim.opt.autoindent  = true
vim.opt.cindent     = true
vim.opt.smartindent = false

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- mouse
vim.opt.mouse     = ''
vim.opt.guicursor = ''

-- wrap
vim.opt.wrap      = false

-- swp files
vim.opt.swapfile = false
vim.backup       = false

-- undo
vim.opt.undodir  = os.getenv( 'HOME' ) .. '/.vim/undodir'
vim.opt.undofile = true

-- searching
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.hlsearch  = true


vim.opt.scrolloff  = 4
vim.opt.signcolumn = 'yes'

vim.opt.isfname:append( '@-@' )

vim.opt.updatetime = 30

-- colors
vim.termguicolors  = true

-- focus
vim.opt.cursorline = true

-- spell check
vim.opt.spell     = true
vim.opt.spelllang = 'en_us'

--split new on right
vim.opt.splitright = true

vim.g.editorconfig = true
