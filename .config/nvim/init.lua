require 'visimp' {
  defaults = {
    foldmethod = 'marker',
  },
  binds = {
    [{ mode = 'n', bind = '<C-Tab>'}] = ':bprev',
    [{ mode = 'n', bind = '<C-S-Tab>'}] = ':bnext'
  },
  lsp = {
    nullls = {
      'formatting.stylua',
      'formatting.prettierd',
      'formatting.latexindent',
    },
  },
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
    'rust'
  },
  theme = {
    package = 'ellisonleao/gruvbox.nvim',
    colorscheme = 'gruvbox',
    background = 'dark',
    lualine = 'gruvbox',
    before = function()
      require'gruvbox'.setup{
        contrast = 'hard',
        overrides = {
          NormalFloat = { link = 'Normal' }
        },
      }
    end
  },
}
