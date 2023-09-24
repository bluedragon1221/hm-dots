# vim: sw=2

{ config, pkgs, ... }:

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
      doc = "$HOME/Documents";
      vid = "$HOME/Videos";
      dl = "$HOME/Downloads";
      cfg = "$HOME/.config";
      p = "$HOME/projects";
      hm = "$HOME/.config/home-manager";
      py = "$HOME/projects/learning_python";
      nvim = "$HOME/.config/nvim";
      r = "$HOME/projects/ROBOTICS";
    };
    initExtra = (builtins.readFile ./initExtra.zsh);
  };
}
