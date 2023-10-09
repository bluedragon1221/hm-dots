# vim: sw=2
{pkgs, ...}: {
  imports = [
    ./xdg
    ./git
    
    # collections
    ./term
    ./desktop

    # Tools
    ./nvim
    ./firefox
    ./wofi

  ];

  home = {
    username = "collin";
    homeDirectory = "/home/collin";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;

  programs.zsh.shellAliases = {
    hm = "home-manager";
    hms = "home-manager switch";
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = ["flakes" "nix-command"];
      eval-cache = false;
    };
  };

  targets.genericLinux.enable = true;
}
