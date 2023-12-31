# vim: sw=2
{pkgs, ...}: {
  imports = [
    ./xdg
    ./git

    # collections
    ./term
    ./desktop

    # Tools
    # ./neovim
    ./nixvim
    ./firefox
    ./kitty
  ];

  home = {
    username = "collin";
    homeDirectory = "/home/collin";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = ["flakes" "nix-command"];
      eval-cache = false;
    };
  };

  targets.genericLinux.enable = true;
}
