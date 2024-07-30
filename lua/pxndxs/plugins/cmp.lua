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
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:BorderBG",
          scrollbar = false,
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:BorderBG",
          scrollbar = false,
        }
      },
      formatting = {
        format = function(entry, vim_item)
        local KIND_ICONS = {
          Tailwind = '󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞',
          Color = ' ',
          Class = '🏘️',
          Constant = '🐈',
          Constructor = ' ',
          Enum = ' ',
          EnumMember = ' ',
          Event = '󰏔 ',
          Field = '󰇽',
          File = '󰈙 ',
          Folder = ' ',
          Function = '󰏇 ',
          Interface = ' ',
          Keyword = '🔑',
          Method = '🧬',
          Module = '󰏭 ',
          Operator = '󰏾 ',
          Property = ' ',
          Reference = ' ',
          Snippet = '',
          Struct = '',
          Text = '🐧',
          TypeParameter = ' ',
          Unit = '',
          Value = ' ',
          Variable = '🐼'
        }
        if vim_item.kind == 'Color' and entry.completion_item.documentation then
          local _, _, r, g, b =
          ---@diagnostic disable-next-line: param-type-mismatch
              string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')

          if r and g and b then
            local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
            local group = 'Tw_' .. color

            if vim.api.nvim_call_function('hlID', { group }) < 1 then
              vim.api.nvim_command('highlight' .. ' ' .. group .. ' ' .. 'guifg=#' .. color)
            end

            vim_item.kind = KIND_ICONS.Tailwind
            vim_item.kind_hl_group = group

            return vim_item
          end
        end

        vim_item.kind = KIND_ICONS[ vim_item.kind ] or vim_item.kind

        return vim_item
      end,
      },
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
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        }
      }
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
