if vim.g.did_load_autopairs_plugin then
  return
end
vim.g.did_load_autopairs_plugin = true

require('nvim-autopairs').setup({
  enable_check_bracket_line = false,
})
