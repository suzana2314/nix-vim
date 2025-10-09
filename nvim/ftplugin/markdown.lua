-- -- Exit if the language server isn't available
-- if vim.fn.executable('marksman') ~= 1 then
--   return
-- end
--
-- local root_files = {
--   ".vim/",
--   ".git/",
--   ".marksman.toml"
-- }
--
-- vim.lsp.start {
--   name = 'marksman',
--   cmd = { 'marksman' },
--   root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
--   capabilities = require('user.lsp').make_client_capabilities(),
-- }
if vim.g.did_load_markdown_plugin then
  return
end
vim.g.did_load_markdown_plugin = true

require('render-markdown').setup({
  file_types = { 'markdown' },
  completions = {
    lsp = {
      enabled = true,
    },
  },
})
