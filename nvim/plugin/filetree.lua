if vim.g.did_load_filetree_plugin then
  return
end
vim.g.did_load_filetree_plugin = true

require('neo-tree').setup {
  close_if_last_window = true,
  popup_border_style = "rounded",
  window = {
    position = "float"
  },
}

