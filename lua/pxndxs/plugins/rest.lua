return {
  'rest-nvim/rest.nvim',
	version = '1.2.1',
  enable = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  ft = 'http',
  config = function()
    local rest_nvim = require( 'rest-nvim' )
    rest_nvim.setup({
      result_split_horizontal = false,
      result_split_in_place = false,
      skip_ssl_verification = false,
      encode_url = true,
      highlight = { enabled = false },
      result = {
        show_url = true,
        show_curl_command = false,
        show_http_info = true,
        show_headers = true,
        formatters = {
          json = 'jq',
          html = function( body )
            return vim.fn.system( { 'tidy', '-i', '-q', '-' }, body )
          end
        },
      },
      jump_to_request = false,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })
    local opts = { noremap = true, silent = true }
    vim.keymap.set( 'n', '<leader>hn', rest_nvim.run, opts )
    vim.keymap.set( 'n', '<leader>hl', rest_nvim.last, opts )
    vim.keymap.set( 'n', '<leader>hp', function () rest_nvim.run( true ) end, opts )
  end
}
