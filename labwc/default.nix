# vim: sw=2

{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ labwc wayland ];

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = 0;
    MOZ_ENABLE_WAYLAND = 1;
    XKB_DEFAULT_LAYOUT = "us";
    XDG_CURRENT_DESKTOP = "wlroots";

    # For Java applications such as JetBrains/Intellij Idea, set this variable
    # to avoid menus with incorrect offset and blank windows
    # See https://github.com/swaywm/sway/issues/595
    _JAVA_AWT_WM_NONREPARENTING = 1;
  };

  home.file.".config/labwc" = {
    source = ./files;
    recursive = true;
  };
}
