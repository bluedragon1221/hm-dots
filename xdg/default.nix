# vim: sw=2

{ config, pkgs, ... }:

{
  xdg.enable = true;

  home.sessionVariables = {
    # GET OUT OF MY $HOME!
    XCURSOR_PATH = "/usr/share/icons:${config.xdg.dataHome}/icons";
    GOPATH = "${config.xdg.dataHome}/go";
    GRADLE_USER_HOME = "${config.xdg.dataHome}/gradle";
    SQLITE_HISTORY = "/dev/null";
    PYTHON_STARTUP = "/etc/python/pythonrc";
    GTK2_RC_FILES = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  programs.zsh.history.path = "${config.xdg.stateHome}/zsh/history";
}
