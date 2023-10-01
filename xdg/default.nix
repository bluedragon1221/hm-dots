# vim: sw=2

{ config, ... }:

{
  xdg.enable = true;

  home.sessionVariables = {
    # GET OUT OF MY $HOME!
    GOPATH = "${config.xdg.dataHome}/go";
    GRADLE_USER_HOME = "${config.xdg.dataHome}/gradle";
    SQLITE_HISTORY = "/dev/null";
    PYTHON_STARTUP = "/etc/python/pythonrc";
    GTK2_RC_FILES = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  programs.zsh.history.path = "${config.xdg.stateHome}/zsh/history";
}
