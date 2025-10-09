default:
  @just --list

[group('dev')]
diff:
  git diff ':!flake.lock'

[group('dev')]
check:
  nix flake check

[group('dev')]
format:
  nixpkgs-fmt .

[group('nix')]
up:
  nix flake update

