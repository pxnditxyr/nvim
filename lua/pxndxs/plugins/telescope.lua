return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
  },
  config = function ()
    local builtin = require( 'telescope.builtin' )
    require( 'telescope' ).setup {
      defaults = {
        sorting_strategy = 'ascending',
        layout_config    = { prompt_position = 'top' },
        winblend         = 20,
      },
    }
    vim.api.nvim_set_hl( 0, 'TelescopeBorder', { bg = '#000000' } )
    vim.keymap.set( 'n', '<leader>ff', function()
      builtin.find_files({
        hidden = true,
        find_command = { 'rg', '--files', '--hidden', '--follow', '--glob', '!.git' }
      })
    end, {} )
    vim.keymap.set( 'n', '<leader>fg', builtin.live_grep, {} )
  end
}
