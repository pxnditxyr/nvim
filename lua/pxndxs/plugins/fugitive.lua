return {
  'tpope/vim-fugitive',
  cmd = { 'G', 'Git' },
  keys = {
    { '<leader>gg', ':G<CR>', desc = 'Git' },
    { '<leader>gp', ':Git pull --rebase<CR>', desc='Git pull rebase' }
  }
}
