return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function ()
    require( 'tokyonight' ).setup({
      style = 'storm',
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = 'dark',
        floats = 'dark',
      },
      sidebars = { 'qf', 'help' },
      lualine_bold = false,
      on_colors = function( colors )
        colors.bg_dark = '#1f2335'
        colors.bg = '#24283b'
        -- color of the current line
        colors.bg_highlight = '#473978'
        colors.terminal_black = '#414868'
        -- normal color
        colors.fg = '#FFDB89'
        colors.fg_dark = '#a9b1d6'
        colors.fg_gutter = '#3b4261'
        colors.dark3 = '#545c7e'
        -- comment color
        colors.comment = '#895f89'
        -- color of current line number
        colors.dark5 = '#737aa2'
        colors.blue0 = '#3d59a1'
        -- color of functions calls, methods, and some definition of variables
        colors.blue = '#0CECDD'
        colors.cyan = '#7dcfff'
        colors.blue1 = '#2ac3de'
        colors.blue2 = '#0db9d7'
        colors.blue5 = '#89ddff'
        colors.blue6 = '#B4F9F8'
        colors.blue7 = '#394b70'
        -- color of sentencies like if, for, while, instance of functions, etc.
        colors.magenta = '#FF8DC7'
        colors.magenta2 = '#ff007c'
        -- color of return local, etc.
        colors.purple = '#FF33BB'
        colors.orange = '#ff9e64'
        colors.yellow = '#e0af68'
        colors.green = '#9ece6a'
        colors.green1 = '#73daca'
        colors.green2 = '#41a6b5'
        colors.teal = '#1abc9c'
        colors.red = '#f7768e'
        colors.red1 = '#db4b4b'
        colors.git = {
          change = '#6183bb',
          add = '#449dab',
          delete = '#914c54',
          conflict = '#bb7a61'
        }
        colors.gitSigns = {
          add = '#9CFF2E',
          change = '#FDFD44',
          delete = '#E97777'
        }
      end,
      on_highlights = function( highlights, colors ) end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
