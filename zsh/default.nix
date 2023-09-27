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
      doc = "~/Documents";
      vid = "~/Videos";
      dl = "~/Downloads";

      cfg = "~/.config";
      hm = "~cfg/home-manager";
      nvim = "~cfg/nvim";

      p = "~/projects";
      py = "~p/learning_python";
      r = "~p/ROBOTICS";
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
	format = "[$path](underline)";
	truncation_length = 5;
	truncate_to_repo = false;
	home_symbol = "~";
	substitutions = {
	  "~/Documents" = "~doc";
	  "~/Videos" = "~vid";
	  "~/Downloads" = "~dl";

	  "~/.config" = "~cfg";
	  "~cfg/home-manager" = "~hm";
	  "~cfg/nvim" = "~nvim";

	  "~/projects" = "~p";
	  "~p/learning_python" = "~py";
	  "~p/ROBOTICS" = "~r";
	};
      };
    };
  };
}
