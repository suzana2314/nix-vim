{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;

  # Make sure we use the pinned nixpkgs instance for wrapNeovimUnstable,
  # otherwise it could have an incompatible signature when applying this overlay.
  pkgs-locked = inputs.nixpkgs.legacyPackages.${pkgs.system};

  # This is the helper function that builds the Neovim derivation.
  mkNeovim = pkgs.callPackage ./mkNeovim.nix {
    inherit (pkgs-locked) wrapNeovimUnstable neovimUtils;
  };

  all-plugins = with pkgs.vimPlugins; [
    # syntax
    nvim-treesitter.withAllGrammars

    # snippets
    luasnip

    # completions
    nvim-cmp
    cmp_luasnip
    lspkind-nvim
    cmp-nvim-lsp
    cmp-nvim-lsp-signature-help
    cmp-buffer
    cmp-path
    cmp-nvim-lua
    cmp-cmdline
    cmp-cmdline-history

    # git
    gitsigns-nvim
    vim-fugitive

    # utils
    nvim-autopairs
    auto-session # saves sessions
    nvim-unception # prevent nested neovim sessions
    which-key-nvim

    # telescope and extensions
    telescope-nvim
    telescope-fzy-native-nvim

    # UI
    lualine-nvim # status line
    nvim-treesitter-context # nvim-treesitter-context
    gruvbox-nvim # theme
    neo-tree-nvim # file explorer
    toggleterm-nvim # terminal

    # navigation/editing enhancement plugins
    vim-unimpaired # predefined ] and [ navigation keymaps
    eyeliner-nvim # highlights unique characters for f/F and t/T motions
    nvim-treesitter-textobjects
    nvim-ts-context-commentstring

    # language specific
    render-markdown-nvim

    # dependencies
    sqlite-lua
    plenary-nvim
    nvim-web-devicons
    vim-repeat
  ];

  extraPackages = with pkgs; [
    lua-language-server
    nixd # nix LSP
    nixfmt-rfc-style # nix formatter
    ripgrep # for telescope
  ];
in
{
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # used in a devShell to avoid rebuilding the config each time
  nvim-dev = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
    appName = "nvim-dev";
    wrapRc = false;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json {
    plugins = all-plugins;
  };
}
