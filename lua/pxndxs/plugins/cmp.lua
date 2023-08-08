return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-git',
    'hrsh7th/cmp-emoji',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
    {
      'L3MON4D3/LuaSnip',
      version = '1.*',
      build = 'make instal_jsregexp',
    },
  },
  config = function ()
    local cmp = require( 'cmp' )
    cmp.setup({
      snippet = {
        expand = function( args )
          require( 'luasnip' ).lsp_expand( args.body )
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs( -4 ),
        ['<C-f>'] = cmp.mapping.scroll_docs( 4 ),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip'  },
        { name = 'emoji'    },
      }, {
        { name = 'buffer' },
      }),
      formatting = {
        format = require( 'lspkind' ).cmp_format({
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
          before = function ( entry, vim_item )
            return vim_item
          end
        })
      },
    })

    cmp.setup.filetype( 'gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' },
      }, {
        { name = 'buffer' },
      })
    })
  end
}
