# vim: sw=2
{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [zsh fzf fd tree neofetch];

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
      cat = "bat";
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

    dirHashes = let
      HOME = config.home.homeDirectory;
    in {
      doc = "${HOME}/Documents";
      vid = "${HOME}/Videos";
      dl = "${HOME}/Downloads";

      cfg = "${HOME}/.config";
      hm = "${HOME}/.config/home-manager";
      nvim = "${HOME}/.config/nvim";

      p = "${HOME}/projects";
      py = "${HOME}/projects/learning_python";
      rs = "${HOME}/projects/rust";
      r = "${HOME}/projects/ROBOTICS";
    };
    initExtra = builtins.readFile ./initExtra.zsh;
  };

  programs.bat = {
    enable = true;
    config.theme = "TwoDark";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$directory$git_branch"
        "$git_status"
        " $character"
      ];
      scan_timeout = 10;
      character = {
        success_symbol = "[λ](green bold)";
        error_symbol = "[λ](red bold)";
      };
      git_branch.format = "[@$branch](underline)";
      git_status = {
        format = "[$conflicted$untracked$modified$staged$renamed$deleted](218)";
        conflicted = "";
        untracked = "[ ?](yellow)";
        modified = "[ *](red bold)";
        staged = "[ +](green bold)";
        renamed = "";
        deleted = "";
        stashed = "";
      };
      directory = {
        format = "$path";
        truncation_length = 5;
        truncate_to_repo = false;
        home_symbol = "~";
        substitutions = {
          "~/Documents" = "󱔘 ";
          "~/Videos" = " ";
          "~/Downloads" = " ";

          "~/.config" = " ";
          " /home-manager" = " ";

          "~/projects" = "󰉋 ";
          "󰉋 /learning_python" = " ";
          "󰉋 /rust" = " ";
          "󰉋 /ROBOTICS" = "󱨚 ";
        };
      };
    };
  };
}
