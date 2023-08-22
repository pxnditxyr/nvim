return {
  'ggandor/leap.nvim',
  config = function ()
    vim.keymap.set( 'n', '_', '<Plug>(leap-backward-to)' )
    vim.keymap.set( 'n', '-', '<Plug>(leap-forward-to)' )
  end
}
