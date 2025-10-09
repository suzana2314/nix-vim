if vim.g.did_load_autosession_plugin then
  return
end
vim.g.did_load_autosession_plugin = true

require('auto-session').setup({

})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
