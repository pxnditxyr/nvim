return {
  'nvim-treesitter/nvim-treesitter',
  build  = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/playground',
    'hiphish/rainbow-delimiters.nvim',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'windwp/nvim-ts-autotag',
  },

  config = function ()
    local configs = require( 'nvim-treesitter.configs' )
    require( 'ts_context_commentstring' ).setup({
      enable_autocmd = false,
      languages = {
        typescript = '// %s',
        javascript = '// %s',
      },
    })
    vim.g.skip_ts_commentstring_module = true
    configs.setup({
      ensure_installed = { 'lua', 'vimdoc', 'vim', 'typescript', 'javascript', 'html', 'http', 'json', 'php' },
      ignore_install = {},
      sync_install = true,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent  = { enable = true },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
      },
      rainbow = {
        enable = true,
        extend_mode = true,
        colors = { '#ffd700', '#ff2442', '#04ff00', '#40e3db', '#fa6e4f', '#fdf5CA', '#ff00ff' },
      },
    })
  end,
}
