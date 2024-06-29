{
  description = "Kickstart Nix environment.";

  inputs = {
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    self,
    darwin,
    home-manager,
    nixpkgs,
    flake-parts,
    ...
  }: let
    username = "cc";
    darwin-system = import ./system/darwin.nix {inherit inputs username;};
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = {
        darwinConfigurations = {
          aarch64 = darwin-system "aarch64-darwin";
          x86_64 = darwin-system "x86_64-darwin";
	      };

        lib = import ./lib {inherit inputs;};
      };

      systems = ["aarch64-darwin" "x86_64-darwin"];

      perSystem = { pkgs, ... }: {
        formatter = pkgs.alejandra;

      	packages = {
          catppuccin-tmux = self.lib.catppuccin-tmux {
            inherit (pkgs.tmuxPlugins) mkTmuxPlugin;
            inherit (pkgs) fetchFromGiHub;
          };
        };
      };
    };
}
