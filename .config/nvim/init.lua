require('visimp')({
  defaults = {
    foldmethod = 'marker',
  },
  binds = {
    [{ mode = 'n', bind = '<C-Tab>' }] = ':bprev',
    [{ mode = 'n', bind = '<C-S-Tab>' }] = ':bnext',
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
    'css',
    'json',
    'vue',
    'go',
    'rust',
  },
  rust = { lsp = 'rust_analyzer' },
  lspformat = {},
  theme = {
    package = 'ellisonleao/gruvbox.nvim',
    colorscheme = 'gruvbox',
    background = 'dark',
    lualine = 'gruvbox',
    before = function()
<<<<<<< HEAD
      require('gruvbox').setup({
=======
      require 'gruvbox'.setup {
>>>>>>> 782a7d2102193fcd770846809211c8f02e03bdf9
        contrast = 'hard',
        overrides = {
          NormalFloat = { link = 'Normal' },
        },
      })
    end,
  },
})
