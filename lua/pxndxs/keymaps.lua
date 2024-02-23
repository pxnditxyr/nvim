
local opts = { noremap = true, silent = true }
local keymap = vim.keymap

keymap.set( 'n', '<A-j>', ':m .+1<Return>==', opts )
keymap.set( 'n', '<A-k>', ':m .-2<Return>==', opts )
keymap.set( 'v', '<A-j>', ':m \'>+1<Return>gv=gv', opts )
keymap.set( 'v', '<A-k>', ':m \'<-2<Return>gv=gv', opts )

-- join lines
keymap.set( 'n', 'J', 'mzJ`z', opts )

-- move in file
keymap.set( 'n', '<C-d>', '<C-d>zz', opts )
keymap.set( 'n', '<C-u>', '<C-u>zz', opts )

-- in search after press n cursor will be in the middle of the screen
keymap.set( 'n', 'n', 'nzzzv', opts )
keymap.set( 'n', 'N', 'Nzzzv', opts )

-- search and replace
keymap.set( 'n', '<leader>fw', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', opts )
keymap.set( 'n', '<leader>fr', ':%s///gc<Left><Left><Left><Left>', opts )

-- best paste
keymap.set( 'x', '<leader>p', '"_dP', opts )

-- copy and cut
keymap.set( 'n', '<leader>aa', ':%y<Return>',  opts )
keymap.set( 'n', '<leader>a',  ':%d<Return>',  opts )
keymap.set( 'n', '<leader>ch', ':%d<Return>i', opts )

-- put  in the end of line
keymap.set( 'n', '<leader>', 'A<ESC>j', opts )

-- separate parenthesis
keymap.set( 'n', '<leader>par', 'a<Space><Esc>h%i<Space><Esc>l%', opts )

-- save and quit
-- save and quit options must be fast to use 
keymap.set( 'n', '<leader>w', ':w<Return>', opts )
keymap.set( 'n', '<leader>z', ':q<Return>', opts )

-- execute node file
keymap.set( 'n', '<leader>bun', ':!bun %<Return>',    opts )
keymap.set( 'n', '<leader>py',   ':!python3 %<Return>', opts )

-- Splits
keymap.set( 'n', '<leader>vs', ':vsplit<Return>', opts )
keymap.set( 'n', '<C-h>', '<C-w>h', opts )
keymap.set( 'n', '<C-l>', '<C-w>l', opts )
keymap.set( 'n', '<C-k>', '<C-w>k', opts )
keymap.set( 'n', '<C-j>', '<C-w>j', opts )


-- Tabs
keymap.set( 'n', '<leader>tn', ':tabnew<Return>', opts )
keymap.set( 'n', '<tab>',      ':tabnext<Return>', opts )
keymap.set( 'n', '<S-tab>',    ':tabprevious<Return>', opts )

-- move between buffers
keymap.set( 'n', '<leader>bn', ':bnext<Return>', opts )
keymap.set( 'n', '<leader>bp', ':bprevious<Return>', opts )
keymap.set( 'n', '<leader>bd', ':bd<Return>', opts )
keymap.set( 'n', '<leader>bl', ':bl<Return>', opts )
keymap.set( 'n', '<leader>bf', ':bf<Return>', opts )
