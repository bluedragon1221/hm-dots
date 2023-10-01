# vim: sw=2

{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka Nerd Font";
      size = 14;
    };
    settings = {
      background_opacity = "0.5";
      allow_remote_control = true;
      enable_audio_bell = false;
      shell = "${pkgs.zsh}/bin/zsh";
      remember_window_size = true;
    };
    theme = "One Dark";
    shellIntegration.enableZshIntegration = true;
  };
}
