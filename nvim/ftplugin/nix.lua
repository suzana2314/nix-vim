-- Exit if the language server isn't available
if vim.fn.executable('nixd') ~= 1 then
  return
end

local root_files = {
  'flake.nix',
  'default.nix',
  'shell.nix',
  '.git',
}

vim.lsp.start {
  name = 'nixd',
  cmd = { 'nixd' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    nixd = {
      formatting = {
        command = { "nixfmt" },
      },
      options = {
        nixos = '(builtins.getFlake (builtins.toString /home/suz/.nix/nix-config)).nixosConfigurations.master.options', -- can't think of a better way to get the path
        home_manager = '(builtins.getFlake (builtins.toString /home/suz/.nix/nix-config)).nixosConfigurations.master.options.home-manager.users.type.getSubOptions []', -- using the home manager module
      },
    },
  },
}
