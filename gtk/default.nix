# vim: sw=2

{config, pkgs, ...}:

{
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
    };
}
