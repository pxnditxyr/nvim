return {
  'lewis6991/gitsigns.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    local gitsigns = require( 'gitsigns' )
    gitsigns.setup {
      signs = {
        add          = { text = '󱝹' },
        change       = { text = '' },
        delete       = { text = '󱂧' },
        topdelete    = { text = '‾' },
        changedelete = { text = '' },
        untracked    = { text = '' },
      },
      on_attach = function( bufnr )
        vim.keymap.set( "n", "<leader>hs", gitsigns.stage_hunk, { buffer = bufnr } )
        vim.keymap.set( "n", "<leader>hu", gitsigns.undo_stage_hunk, { buffer = bufnr } )
        vim.keymap.set( "n", "<leader>hr", gitsigns.reset_hunk, { buffer = bufnr } )
        vim.keymap.set( "n", "<leader>hP", gitsigns.preview_hunk, { buffer = bufnr } )
        vim.keymap.set( "n", "<leader>hj", gitsigns.next_hunk, { buffer = bufnr } )
        vim.keymap.set( "n", "<leader>hk", gitsigns.prev_hunk, { buffer = bufnr } )
      end,
      max_file_length = 10000,
    }
  end
}
