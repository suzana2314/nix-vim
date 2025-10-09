{
  description = "Neovim derivation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";
  };

  outputs =
    {
      self,
      nixpkgs,
      gen-luarc,
      ...
    }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;

      neovim-overlay = import ./nix/neovim-overlay.nix { inherit inputs; };
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              neovim-overlay
              gen-luarc.overlays.default
            ];
          };
        in
        {
          default = pkgs.nvim-pkg;
          nvim = pkgs.nvim-pkg;
        }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              neovim-overlay
              gen-luarc.overlays.default
            ];
          };
        in
        {
          default = pkgs.mkShell {
            name = "nvim-devShell";
            buildInputs = with pkgs; [
              lua-language-server
              nixd
              stylua
              luajitPackages.luacheck
              nvim-dev
              just
            ];

            shellHook = ''
              ln -fs ${pkgs.nvim-luarc-json} .luarc.json
              ln -Tfns $PWD/nvim ~/.config/nvim-dev
            '';
          };
        }
      );

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      overlays.default = neovim-overlay;
    };
}
