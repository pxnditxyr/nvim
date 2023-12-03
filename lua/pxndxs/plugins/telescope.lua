return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'kyazdani42/nvim-web-devicons',
  },
  config = function ()
    local builtin = require( 'telescope.builtin' )
    require( 'telescope' ).setup {
      defaults = {
        sorting_strategy = 'ascending',
        layout_config    = { prompt_position = 'top' },
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
          grouped  = true,
          hidden   = true,
          mappings = {
            [ 'i' ] = {
              [ '<C-t>' ] = require 'telescope.actions'.select_tab
            },
            [ 'n' ] = {
              [ '<C-t>' ] = require 'telescope.actions'.select_tab
            }
          },
        },
      },
    }

    require( 'telescope' ).load_extension( 'file_browser' )

    vim.keymap.set( 'n', '<leader>ff', function() builtin.find_files( { hidden = true, find_command = { 'rg', '--files', '--hidden', '--follow', '--glob', '!.git' } } ) end, {} )
    vim.keymap.set( 'n', '<leader>fg', builtin.live_grep, {} )
    vim.keymap.set( 'n', '<leader>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true } )
  end
}
