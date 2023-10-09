# vim: sw=2
_: {
  programs.wofi = {
    enable = true;
    settings = {
      width = 650;
      height = 256;
      mode = "drun";
      filter_rate = 100;
    };
    style = builtins.readFile ./wofi.css;
  };
}
