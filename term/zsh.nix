{config, ...}: {
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

    autocd = true;
    enableAutosuggestions = true;
    enableVteIntegration = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    history = {
      ignoreSpace = true;
      ignoreDups = true;
    };

    initExtra = builtins.readFile ./initExtra.zsh;
  };
}
