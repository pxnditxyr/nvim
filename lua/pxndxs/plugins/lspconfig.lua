return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'folke/noice.nvim'
  },
  event = 'VeryLazy',
  config = function ()

    vim.diagnostic.config {
      float = { border = "rounded" },
    }

    vim.keymap.set( 'n', '<space>e', vim.diagnostic.open_float )
    vim.keymap.set( 'n', '<space>q', vim.diagnostic.setloclist )

    local lspconfig = require( 'lspconfig' )

    lspconfig.pyright.setup({})
    lspconfig.tsserver.setup({})
    lspconfig.yamlls.setup({})
    lspconfig.arduino_language_server.setup({})
    lspconfig.prismals.setup({})
    lspconfig.tailwindcss.setup({})
    lspconfig.intelephense.setup({})
    lspconfig.emmet_ls.setup({})

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
        -- vim.keymap.set( 'n', 'gd', vim.lsp.buf.definition, opts )
        vim.keymap.set( 'n', 'gd', "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts )
        vim.keymap.set('n', 'K', require("noice.lsp").hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set( 'n', '<space>D', vim.lsp.buf.type_definition, opts )
        vim.keymap.set( 'n', '<space>rn', vim.lsp.buf.rename, opts )
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- vim.keymap.set('n', '<space>f', function()
        --   vim.lsp.buf.format { async = true }
        -- end, opts)
      end

    } )

    local mason = require( 'mason' )
    mason.setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '🕐',
          package_uninstalled = '❌'
        }
      }
    })
    local options = {
      ensure_installed = {
        'pyright',
        'typescript-language-server',
        'yaml-language-server',
        'arduino-language-server',
        'prisma-language-server',
        'tailwindcss-language-server',
        'intelephense',
        'lua-language-server',
        'emmet-ls',
      },
      max_concurrent_installers = 10
    }
    mason.setup( options )
    vim.api.nvim_create_user_command( 'MasonInstallAll', function()
      vim.cmd( 'MasonInstall ' .. table.concat( options.ensure_installed, ' ' ) )
    end, {} )
  end
}
