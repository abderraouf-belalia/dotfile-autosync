vim.o.background = 'dark'

-- default config
require('solarized').setup({
    transparent = true, -- enable transparent background
    styles = {
      comments = { italic = true },
      functions = {},
      variables = {},
      numbers = {},
      constants = {},
      parameters = {},
      keywords = {},
      types = {},
    }
})


vim.cmd.colorscheme = 'solarized'
