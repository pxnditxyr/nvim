
local key_options = {
  noremap = true,
  silent = true
}

vim.keymap.set( 'n', '<A-j>', ':m .+1<CR>==', key_options )
vim.keymap.set( 'n', '<A-k>', ':m .-2<CR>==', key_options )
vim.keymap.set( 'v', '<A-j>', ':m \'>+1<CR>gv=gv', key_options )
vim.keymap.set( 'v', '<A-k>', ':m \'<-2<CR>gv=gv', key_options )

-- join lines
vim.keymap.set( 'n', 'J', 'mzJ`z', key_options )

-- move in file
vim.keymap.set( 'n', '<C-d>', '<C-d>zz', key_options )
vim.keymap.set( 'n', '<C-u>', '<C-u>zz', key_options )

-- in search after press n cursor will be in the middle of the screen
vim.keymap.set( 'n', 'n', 'nzzzv', key_options )
vim.keymap.set( 'n', 'N', 'Nzzzv', key_options )

-- search and replace
vim.keymap.set( 'n', '<leader>rw', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', key_options );
vim.keymap.set( 'n', '<leader>ra', ':%s///gc<Left><Left><Left><Left>', key_options );

-- best paste
vim.keymap.set( 'x', '<leader>p', '"_dP', key_options )

-- copy and cut
vim.keymap.set( 'n', '<leader>aa', ':%y<CR>',  key_options );
vim.keymap.set( 'n', '<leader>a',  ':%d<CR>',  key_options );
vim.keymap.set( 'n', '<leader>ch', ':%d<CR>i', key_options );

-- put ; in the end of line
vim.keymap.set( 'n', '<leader>;', 'A;<ESC>j', key_options );

-- separate parenthesis
vim.keymap.set( 'n', '<leader>par', 'a<Space><Esc>h%i<Space><Esc>l%', key_options );

-- save and quit
vim.keymap.set( 'n', '<leader>w', ':w<CR>', key_options );
vim.keymap.set( 'n', '<leader>q', ':q<CR>', key_options );

-- execute node file
vim.keymap.set( 'n', '<leader>node', ':!node %<CR>',    key_options );
vim.keymap.set( 'n', '<leader>py',   ':!python3 %<CR>', key_options );

-- split window change
-- left
vim.keymap.set( 'n', '<C-h>', '<C-w>h', key_options );
vim.keymap.set( 'n', '<C-l>', '<C-w>l', key_options );
vim.keymap.set( 'n', '<C-k>', '<C-w>k', key_options );
vim.keymap.set( 'n', '<C-j>', '<C-w>j', key_options );
