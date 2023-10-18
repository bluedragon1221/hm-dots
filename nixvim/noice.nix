{
  enable = true;

  cmdline.format = {
    cmdline = {
      pattern = "^:";
      icon = ">";
      lang = "vim";
    };
    search_down = {
      kind = "search";
      pattern = "^/";
      icon = " ";
      lang = "regex";
    };
    search_up = {
      kind = "search";
      pattern = "^%?";
      icon = " ";
      lang = "regex";
    };
  };

  notify = {
    enabled = true;
    view = "notify";
  };
}
