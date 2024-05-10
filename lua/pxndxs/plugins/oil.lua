return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config = function ()
    require( "oil" ).setup({
      default_file_explorer = true,
      columns = {
        "icon",
      },
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = true,
        list = true,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      delete_to_trash = false,
      skip_confirm_for_simple_edits = false,
      prompt_save_on_select_new_entry = true,
      cleanup_delay_ms = 2000,
      autosave_changes = false,
      constrain_cursor = "editable",
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
      use_default_keymaps = true,
      view_options = {
        show_hidden = true,
        is_hidden_file = function( name, bufnr )
          return vim.startswith( name, "." )
        end,
        is_always_hidden = function( name, bufnr )
          local names = {
            ".git",
            "node_modules",
            "__pycache__",
            "coverage",
            "bun.lockb",
            "yarn.lock",
            "package-lock.json",
            "pnpm-lock.yaml",
            "postgres",
            "mysql",
            "sqlite",
            "mongo",
            "cassandra"
          }
          local root_path = vim.fn.getcwd()
          local files_path = vim.fn.expand( "%" )
          local new_path = ""
          if type( files_path ) == "table" then
            for _, path in ipairs( files_path ) do
              new_path = new_path .. path
            end
          else
            new_path = files_path
          end
          local new_file_path = string.sub( new_path, 7 )
          if new_file_path == root_path .. '/' then
            return vim.tbl_contains( names, name )
          end
          return false
        end,
        sort = {
          { "type", "asc" },
          { "name", "asc" },
        },
      },
      float = {
        padding = 4,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        override = function(conf)
          return conf
        end,
      },
      preview = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        update_on_cursor_moved = true,
      },
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        minimized_border = "none",
        win_options = {
          winblend = 0,
        },
      },
    })
    -- vim.keymap.set( 'n', '<leader>o', '<CMD>Oil<CR>', { desc = 'Oil' } )
    vim.keymap.set( 'n', '<leader>o', '<CMD>Oil<CR>', { desc = 'Oil' } )
    vim.keymap.set('n', '<leader>OS', function()
      vim.cmd('vsplit')
      vim.cmd('vertical resize 30')
      vim.cmd('Oil')
    end, { desc = 'Open Oil in Left Window' })
    vim.keymap.set( 'n', '<leader>OE', '<CMD>Oil .env<CR>', { desc = 'Oil .env' } )
  end
}
