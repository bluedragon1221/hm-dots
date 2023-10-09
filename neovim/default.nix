# vim: sw=2
{pkgs, ...}: {
  programs.neovim.enable = true; # installs neovim
  home.file.".config/nvim" = {
    source = ./files;
    recursive = true;
  };
}
