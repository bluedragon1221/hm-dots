# vim: sw=2
_: {
  programs.neovim.enable = true; # installs neovim
  home.file.".config/nvim" = {
    source = ./files;
    recursive = true;
  };
}
