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
  },
  event = 'InsertEnter',
  config = function ()

    local has_words_before = function ()
      unpack = unpack or table.unpack
      local line, col = unpack( vim.api.nvim_win_get_cursor( 0 ) )
      return col ~= 0 and vim.api.nvim_buf_get_lines( 0, line - 1, line, true )[ 1 ]:sub( col, col ):match( '%s' ) == nil
    end

    local luasnip = require( 'luasnip' )
    local cmp = require( 'cmp' )

    cmp.setup({
      snippet = {
        expand = function( args )
          luasnip.lsp_expand( args.body )
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs( -4 ),
        ['<C-f>'] = cmp.mapping.scroll_docs( 4 ),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Tab>'] = cmp.mapping( function ( fallback )
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-S-Tab>'] = cmp.mapping( function ( fallback )
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable( -1 ) then
            luasnip.jump( -1 )
          else
            fallback()
          end
        end )
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
            -- vim_item.kind = require( 'lspkind' ).presets.default[ entry.kind ]
            -- .. ' ' .. vim_item.kind
            return vim_item
          end
        })
      },
    })
    cmp.setup.filetype( 'gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' },
      }, {
          { name = 'buffer' },
        })
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
          { name = 'cmdline' }
        })
    })
  end
}
