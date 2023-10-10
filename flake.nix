# vim: sw=2
{
  description = "Home Manager configuration of Collin Williams";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nix-formatter-pack.url = "github:Gerschtli/nix-formatter-pack";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nix-formatter-pack,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations.collin = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./home.nix];
    };

    formatter.${system} = nix-formatter-pack.lib.mkFormatter {
      inherit nixpkgs;
      system = "x86_64-linux";

      config.tools = {
        deadnix.enable = true;
        alejandra.enable = true;
        statix.enable = true;
      };

      extraModules = [];
    };

    # "nix run ." will run home-manager switch
    defaultPackage.${system} = home-manager.defaultPackage.${system};
  };
}
