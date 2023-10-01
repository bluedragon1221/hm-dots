# vim: sw=2
{pkgs, ...}: {
  home.packages = with pkgs; [neovim];
  home.file.".config/nvim" = {
    source = ./files;
    recursive = true;
  };
}
