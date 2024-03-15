{
  description = "Nix on macOS";

  inputs = {
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
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
    };
}
