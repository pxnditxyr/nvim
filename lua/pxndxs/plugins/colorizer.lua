return {
  'norcalli/nvim-colorizer.lua',
  event = 'VeryLazy',
  config = function ()
    require( 'colorizer' ).setup(
      { '*' },
      {
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      }
    )
  end
}
