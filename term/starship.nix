# vim: sw=2
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
        format = "[ $conflicted$untracked$modified$staged$renamed$deleted](218)";
        style = "cyan";
        conflicted = "";
        untracked = "[?](yellow)";
        modified = "[*](red bold)";
        staged = "[+](green bold)";
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
          "󰉋 /ROBOTICS" = "󱨚 ";
        };
      };
    };
  };
}
