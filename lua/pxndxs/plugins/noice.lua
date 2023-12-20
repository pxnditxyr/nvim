return {
  'folke/noice.nvim',
  event = "VeryLazy",
  opts = function(_, opts)
    opts.commands = {
      all = {
        -- options for the message history that you get with `:Noice`
        view = "vsplit",
        opts = { enter = true, format = "details" },
        filter = {},
      },
    }
    vim.api.nvim_create_autocmd( "FileType", {
      pattern = "markdown",
      callback = function( event )
        vim.schedule( function()
						require( "noice.text.markdown" ).keys( event.buf )
					end )
				end,
			} )
		end,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify'
  },
  config = function ()
    require( "noice" ).setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    })
  end
}
