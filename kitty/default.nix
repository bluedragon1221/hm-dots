# vim: sw=2

{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ kitty ];
  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka Nerd Font";
      size = 14;
    };
    settings = {
      background_opacity = 1;
      allow_remote_control = true;
      enable_audio_bell = false;
      shell = "${config.home.homeDirectory}/.nix-profile/bin/zsh";
      remember_window_size = true;
    };
    theme = "One Dark";
    shellIntegration.enableZshIntegration = true;
  };
}
