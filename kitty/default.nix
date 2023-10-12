# vim: sw=2
{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerdfonts.override {fonts = ["Iosevka"];};
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
