# vim: sw=2

{ pkgs, ... }: {
  imports = [
    # ./home
    ./xdg
    ./git

    # Tools
    ./nvim
    ./zsh
    ./hyprland
    ./kitty
    # ./schizofox
    ./firefox
    ./waybar
    # ./wofi
  ];

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
