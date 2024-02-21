return {
  'NvChad/nvim-colorizer.lua',
  event = 'VeryLazy',
  config = function ()
    require( 'colorizer' ).setup({
      { "*" },
      user_default_options = {
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        tailwind = true,
      }
    })
  end
}
