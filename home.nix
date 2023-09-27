# vim: sw=2

{ config, pkgs, ... }:

{
  imports = [
    ./home
    ./xdg
    ./git

    # Tools
    ./nvim
    ./zsh
    ./labwc
    ./kitty
    ./firefox
    ./waybar
  ];

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
