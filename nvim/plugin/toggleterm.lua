if vim.g.did_load_toggleterm_plugin then
  return
end
vim.g.did_load_toggleterm_plugin = true

require('toggleterm').setup({
  direction = 'float',
  autochdir = true,
  open_mapping = [[<leader>gt]],
  insert_mappings = false,
  start_in_insert = true,
  float_opts = {
    border = 'curved',
  },
})
