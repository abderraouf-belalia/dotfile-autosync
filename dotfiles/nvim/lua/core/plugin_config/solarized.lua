vim.o.background = 'dark'

-- default config
require('solarized').setup({
    transparent = false, -- enable transparent background
    styles = {
      comments = { italic = true },
      functions = { bold = true },
      variables = { italic = true },
      numbers = {},
      constants = {},
      parameters = {},
      keywords = { bold = true },
      types = { italic = true },
    }
})


vim.cmd.colorscheme = 'solarized'
