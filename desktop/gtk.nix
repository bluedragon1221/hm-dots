# vim: sw=2
{pkgs, ...}: {
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Phinger Cursors (light)";
      package = pkgs.phinger-cursors;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Shades of Gray";
      package = pkgs.shades-of-gray-theme;
    };
  };
}
