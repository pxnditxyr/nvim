return {
  'giusgad/pets.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'giusgad/hologram.nvim'
  },
  config = function()
    require( 'pets' ).setup({
      speed_multiplier = 1,
      default_pet = "crab",
      default_style = "red",
    })
  end
}
