return {
  'ggandor/leap.nvim',
  event = 'VeryLazy',
  config = function ()
    vim.keymap.set( 'n', '-', '<Plug>( leap-forward )', {} )
    vim.keymap.set( 'n', '_', '<Plug>( leap-backward )', {} )
  end
}
