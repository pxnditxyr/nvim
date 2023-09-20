
local opts = {
  noremap = true,
  silent = true
}

vim.keymap.set( 'n', '<A-j>', ':m .+1<CR>==', opts )
vim.keymap.set( 'n', '<A-k>', ':m .-2<CR>==', opts )
vim.keymap.set( 'v', '<A-j>', ':m \'>+1<CR>gv=gv', opts )
vim.keymap.set( 'v', '<A-k>', ':m \'<-2<CR>gv=gv', opts )

-- join lines
vim.keymap.set( 'n', 'J', 'mzJ`z', opts )

-- move in file
vim.keymap.set( 'n', '<C-d>', '<C-d>zz', opts )
vim.keymap.set( 'n', '<C-u>', '<C-u>zz', opts )

-- in search after press n cursor will be in the middle of the screen
vim.keymap.set( 'n', 'n', 'nzzzv', opts )
vim.keymap.set( 'n', 'N', 'Nzzzv', opts )

-- search and replace
vim.keymap.set( 'n', '<leader>fw', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', opts )
vim.keymap.set( 'n', '<leader>fr', ':%s///gc<Left><Left><Left><Left>', opts )

-- best paste
vim.keymap.set( 'x', '<leader>p', '"_dP', opts )

-- copy and cut
vim.keymap.set( 'n', '<leader>aa', ':%y<CR>',  opts )
vim.keymap.set( 'n', '<leader>a',  ':%d<CR>',  opts )
vim.keymap.set( 'n', '<leader>ch', ':%d<CR>i', opts )

-- put  in the end of line
vim.keymap.set( 'n', '<leader>', 'A<ESC>j', opts )

-- separate parenthesis
vim.keymap.set( 'n', '<leader>par', 'a<Space><Esc>h%i<Space><Esc>l%', opts )

-- save and quit
vim.keymap.set( 'n', '<leader>w', ':w<CR>', opts )
vim.keymap.set( 'n', '<leader>v', ':q<CR>', opts )

-- execute node file
vim.keymap.set( 'n', '<leader>bun', ':!bun %<CR>',    opts )
vim.keymap.set( 'n', '<leader>py',   ':!python3 %<CR>', opts )

-- split window change
-- left
vim.keymap.set( 'n', '<C-h>', '<C-w>h', opts )
vim.keymap.set( 'n', '<C-l>', '<C-w>l', opts )
vim.keymap.set( 'n', '<C-k>', '<C-w>k', opts )
vim.keymap.set( 'n', '<C-j>', '<C-w>j', opts )
