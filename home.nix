# vim: sw=2

{ pkgs, ... }: {
  imports = [
    ./xdg
    ./git

    # Tools
    ./nvim
    ./zsh
    ./hyprland
    ./kitty
    ./firefox
    ./waybar
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
    settings.experimental-features = [ "flakes" "nix-command" ];
  };

  targets.genericLinux.enable = true;
}
