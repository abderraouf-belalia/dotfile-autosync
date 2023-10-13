require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'solarized',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
