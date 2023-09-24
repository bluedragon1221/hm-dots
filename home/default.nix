# vim: sw=2

{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    # Home Manager needs a bit of information about you and the paths it should manage.
    username = "collin";
    homeDirectory = "/home/collin";
    stateVersion = "23.05";
  };

  programs.zsh.shellAliases = {
    hm = "home-manager";
    hms = "home-manager switch";
  };
}
