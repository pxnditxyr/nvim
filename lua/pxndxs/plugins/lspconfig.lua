return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
  },
  event = 'VeryLazy',
  config = function ()
    vim.keymap.set( 'n', '<space>e', vim.diagnostic.open_float )
    vim.keymap.set( 'n', '[d', vim.diagnostic.goto_prev )
    vim.keymap.set( 'n', ']d', vim.diagnostic.goto_next )
    vim.keymap.set( 'n', '<space>q', vim.diagnostic.setloclist )

    local lspconfig = require( 'lspconfig' )

    lspconfig.pyright.setup({})
    lspconfig.tsserver.setup({})
    lspconfig.yamlls.setup({})
    lspconfig.arduino_language_server.setup({})
    lspconfig.prismals.setup({})
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT', },
          diagnostics = { globals = { 'vim' }, },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME }
          },
          -- telemetry = { enable = false, },
        },
      },
    })


    vim.api.nvim_create_autocmd( 'LspAttach', {

      group = vim.api.nvim_create_augroup( 'UserLspConfig', {} ),
      callback = function ( ev )
        vim.bo[ ev.buf ].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end

    } )


    require( 'mason' ).setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '🕐',
          package_uninstalled = '❌'
        }
      }
    })
  end
}
