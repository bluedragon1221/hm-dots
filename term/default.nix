# vim: sw=2
{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [zsh fzf fd tree neofetch dtach];

  programs.zsh = {
    enable = true;

    shellAliases = import ./aliases.nix;
    dirHashes = import ./dirHashes.nix {inherit config;};
		initExtra = builtins.readFile ./initExtra.zsh;

    autocd = true;
    enableAutosuggestions = true;
    enableVteIntegration = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    history = {
      ignoreSpace = true;
      ignoreDups = true;
    };
  };

  programs.bat = {
    enable = true;
    config.theme = "TwoDark";
  };

  programs.starship = {
    enable = true;

		directory.substitutions = import ./substitutions.nix;

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
        format = "[$untracked$modified$staged](218)";
        untracked = "[ ?](yellow)";
        modified = "[ *](red bold)";
        staged = "[ +](green bold)";
      };
      directory = {
        format = "$path";
        truncation_length = 5;
        truncate_to_repo = false;
      };
    };
  };
}
