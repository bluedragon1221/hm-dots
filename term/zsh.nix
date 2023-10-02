# vim: sw=2
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./starship.nix
  ];

  home.packages = with pkgs; [zsh fzf];

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
    initExtra = builtins.readFile ./initExtra.zsh;
  };
}
