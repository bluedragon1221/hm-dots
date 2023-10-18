_: {
  imports = let
    nixvim = import (builtins.fetchGit { url = "https://github.com/nix-community/nixvim"; });
  in [
		nixvim.homeManagerModules.nixvim
	];

  programs.nixvim = {
    enable = true;

    plugins.lualine = import ./lualine.nix;
    plugins.nvim-cmp = import ./cmp.nix;
    plugins.noice = import ./noice.nix;

		plugins.notify.enable = true;
    plugins.barbecue.enable = true;

    colorschemes.onedark.enable = true;

    plugins.lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
        pyright.enable = true;
      };
    };

		plugins.nvim-autopairs = {
			enable = true;
		};

    keymaps = [
      {
        key = "<leader>ff";
        action = ":FZF<CR>";
        options = {
          silent = true;
        };
      }
    ];

    globals = {
      mapleader = " ";
    };

    options = {
      nu = true;
      rnu = false;
      cursorline = true;
      shiftwidth = 4;
      showmode = false;
    };

    highlight.ExtraWhitespace.bg = "red";
    match.ExtraWhitespace = "\\s\\+$";
    autoCmd = [
      {
        event = "FileType";
        pattern = "nix";
        command = "setlocal tabstop=2 shiftwidth=2";
      }
    ];
  };
}
