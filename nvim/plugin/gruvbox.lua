if vim.g.did_load_gruvbox_plugin then
  return
end
vim.g.did_load_gruvbox_plugin = true

require('gruvbox').setup({
  terminal_colors = true,
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = false,
  contrast = "hard",
})
vim.cmd("colorscheme gruvbox")
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' }) -- to remove annoying background on floating windows
