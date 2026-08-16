require('config.globals')
require('config.options')
require('config.keymap')
require('config.autocmd')
require('config.lsp')
require('config.lazy')


vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'twig' },
  callback = function() vim.treesitter.start() end,
})
