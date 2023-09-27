# vim: sw=2

{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    zsh
    fzf
  ];

  programs.zsh = {
    enable = true;

    shellAliases = {
      grep = "grep --color=auto";
      yay = "yay --sudo doas --noconfirm";
      wget = "wget --hsts-file=/dev/null";
      ls = "ls -A1F --color=auto --group-directories-first --hyperlink";
      l = "ls";
      c = "clear";
      e = "nvim";
    };
    autocd = true;
    enableAutosuggestions = true;
    enableVteIntegration = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    history = {
      ignoreSpace = true;
      ignoreDups = true;
    };

    dirHashes = {
      doc = "${config.home.homeDirectory}/Documents";
      vid = "${config.home.homeDirectory}/Videos";
      dl = "${config.home.homeDirectory}/Downloads";

      cfg = "${config.home.homeDirectory}/.config";
      hm = "${config.home.homeDirectory}/.config/home-manager";
      nvim = "${config.home.homeDirectory}/.config/nvim";

      p = "${config.home.homeDirectory}/projects";
      py = "${config.home.homeDirectory}/projects/learning_python";
      r = "${config.home.homeDirectory}/projects/ROBOTICS";
    };
    initExtra = (builtins.readFile ./initExtra.zsh);
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
	"$directory$git_branch"
	" $git_status"
	"$character"
      ];
      scan_timeout = 10;
      character = {
	success_symbol = "[λ](green bold)";
	error_symbol = "[λ](red bold)";
      };
      git_branch.format = "[@$branch](underline)";
      git_status = {
	format = "[*$conflicted$untracked$modified$staged$renamed$deleted](218) ";
	style = "cyan";
	conflicted = "";
	untracked = "?";
	modified = "M";
	staged = "S";
	renamed = "";
	deleted = "D";
	stashed = "≡";
      };
      directory = {
	format = "[$path]()";
	truncation_length = 5;
	truncate_to_repo = false;
	home_symbol = "~";
	substitutions = {
	  "~/Documents" = "󱔘 ";
	  "~/Videos" = " ";
	  "~/Downloads" = " ";

	  "~/.config" = " ";
	  "home-manager" = "hm";

	  "~/projects" = "󰉋 ";
	  "~p/learning_python" = " ";
	  "~p/ROBOTICS" = "󱨚 ";
	};
      };
    };
  };
}
