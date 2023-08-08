return {
  'nvim-treesitter/nvim-treesitter',
  build  = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/playground',
    'p00f/nvim-ts-rainbow',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'windwp/nvim-ts-autotag',
  },
  config = function ()
    local configs = require( 'nvim-treesitter.configs' )
    configs.setup({
      ensure_installed = { 'lua', 'vimdoc', 'vim', 'typescript', 'javascript', 'html', 'http', 'json' },
      ignore_install = {},
      sync_install = true,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      indent  = { enable = true },
      autotag = { enable = true },
      context_commentstring = { enable = true },
      rainbow = {
        enable = true,
        extend_mode = true,
        colors = { '#ffd700', '#ff2442', '#04ff00', '#40e3db', '#fa6e4f', '#fdf5ca', '#ff00ff' },
      },
    })
  end,
}
