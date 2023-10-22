# vim: sw=2
{
  description = "Home Manager configuration of Collin Williams";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      flake = {
        homeConfigurations.collin = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./home.nix
          ];
        };
      };

      perSystem = {
        system,
        pkgs,
        ...
      }: {
        apps.default.program = inputs.home-manager.defaultPackage.${system};

        treefmt = {
          package = pkgs.treefmt;
          programs.alejandra.enable = true;
          projectRootFile = "flake.nix";
        };
      };
    };
}
