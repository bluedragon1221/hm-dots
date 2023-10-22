# vim: sw=2
{
  pkgs,
  ...
}: {
	imports = [
		./zsh.nix
		./starship.nix
	];

  home.packages = with pkgs; [zsh fzf fd tree neofetch dtach];

  programs.bat = {
    enable = true;
    config.theme = "TwoDark";
  };
}
