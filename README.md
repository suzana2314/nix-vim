
<br />
<div align="center">
<h1>Nix Vim</h1>

[![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Nix](https://img.shields.io/badge/nix-0175C2?style=for-the-badge&logo=NixOS&logoColor=white)](https://nixos.org/)
[![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org/)

*Based on [kickstart-nix.nvim](https://github.com/nix-community/kickstart-nix.nvim)*

</div>

## Quick Start

Try this configuration without installing anything permanent. If you have Nix with [flakes](https://wiki.nixos.org/wiki/Flakes) enabled:

```console
nix run "github:suzana2314/nix-vim"
```

## Development

Want to customize this config? The repository includes a Nix development shell that automatically loads your local configuration. Enter the shell using:

- `nix develop`, or
- `direnv allow` for automatic activation

---

**Note:** This is a personal configuration that changes frequently. Consider using [kickstart-nix.nvim](https://github.com/nix-community/kickstart-nix.nvim) as a starting point for your own setup instead of depending on this directly.
