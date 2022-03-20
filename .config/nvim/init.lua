vim.g['gruvbox_contrast_dark'] = 'hard'

-- local gruvbox = require'visimp.themes.gruvbox'
require('visimp')({
  defaults = {
    foldmethod = 'marker',
  },
  lspformat = {},
  lsp = {
    nullls = {
      'formatting.stylua',
      'formatting.prettier',
      'formatting.latexindent',
    },
  },
  languages = {
    'c',
    'latex',
    'lua',
    'go',
  },
  python = {
    lsp = 'pyright', -- Avoid installing pyright, use the system's default
  },
  lspsignature = {},
  theme = { 'gruvbox-community/gruvbox', 'gruvbox', 'dark', 'gruvbox' },
  -- theme = gruvbox()
})
