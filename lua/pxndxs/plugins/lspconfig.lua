return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
  },
  event = "VeryLazy",
  config = function ()
    local opts = { noremap = true, silent = true }
    vim.keymap.set( 'n', '<space>e', vim.diagnostic.open_float, opts )
    vim.keymap.set( 'n', '[d', vim.diagnostic.goto_prev, opts )
    vim.keymap.set( 'n', ']d', vim.diagnostic.goto_next, opts )
    vim.keymap.set( 'n', '<space>q', vim.diagnostic.setloclist, opts )

    local on_attach = function( client, bufnr )
      vim.api.nvim_buf_set_option( bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc' )

      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set( 'n', 'gD', vim.lsp.buf.declaration, bufopts )
      vim.keymap.set( 'n', 'gd', vim.lsp.buf.definition, bufopts )
      vim.keymap.set( 'n', 'K', vim.lsp.buf.hover, bufopts )
      vim.keymap.set( 'n', 'gi', vim.lsp.buf.implementation, bufopts )
      vim.keymap.set( 'n', '<C-k>', vim.lsp.buf.signature_help, bufopts )
      vim.keymap.set( 'n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts )
      vim.keymap.set( 'n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts )
      vim.keymap.set( 'n', '<space>wl', function()
        print( vim.inspect( vim.lsp.buf.list_workspace_folders() ) )
      end, bufopts )

      vim.keymap.set( 'n', '<space>D', vim.lsp.buf.type_definition, bufopts )
      vim.keymap.set( 'n', '<space>rn', vim.lsp.buf.rename, bufopts )
      vim.keymap.set( 'n', '<space>ca', vim.lsp.buf.code_action, bufopts )
      vim.keymap.set( 'n', 'gr', vim.lsp.buf.references, bufopts )
    end

    local lspconfig = require( 'lspconfig' )
    local lsp_flags = { debounce_text_changes = 150 }

    lspconfig.pyright.setup({
      on_attach = on_attach,
      flags     = lsp_flags,
    })

    lspconfig.tsserver.setup({
      on_attach = on_attach,
      flags     = lsp_flags,
    })

    lspconfig.yamlls.setup({
      on_attach = on_attach,
      flags     = lsp_flags,
    })

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      flags     = lsp_flags,
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT', },
          diagnostics = { globals = { 'vim' }, },
          workspace = {
            library = vim.api.nvim_get_runtime_file( "", true ),
            checkThirdParty = false,
          },
          telemetry = { enable = false, },
        },
      },
    })

    require( 'mason' ).setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "🕐",
          package_uninstalled = "❌"
        }
      }
    })
  end
}
