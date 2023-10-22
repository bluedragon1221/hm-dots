{lib, ...}: {
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
        format = "[$untracked$modified$staged](218)";
        untracked = "[ ?](yellow)";
        modified = "[ *](red bold)";
        staged = "[ +](green bold)";
        deleted = "[ x](red bold)";
      };

      directory = {
        format = "$path";
        truncation_length = 5;
        truncate_to_repo = false;
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
