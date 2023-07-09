require('visimp')({
  defaults = {
    foldmethod = 'marker',
  },
  lsp = {
    nullls = {
      'formatting.stylua',
      'formatting.prettierd',
      'formatting.latexindent',
    },
  },
  rust = { lsp = 'rust_analyzer' },
  languages = {
    'c',
    'latex',
    'lua',
    'javascript',
    'html',
    'vue',
    'css',
    'json',
    'go',
    'rust',
    'svelte',
  },
  diagnostics = {},
  -- lspformat = {},
  theme = {
    package = 'ellisonleao/gruvbox.nvim',
    colorscheme = 'gruvbox',
    background = 'dark',
    lualine = 'gruvbox',
    before = function()
      require('gruvbox').setup({
        contrast = 'hard',
        overrides = {
          NormalFloat = { link = 'Normal' },
        },
      })
    end,
  },
})
