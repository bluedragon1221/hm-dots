{
  enable = true;

  componentSeparators = {
    left = "";
    right = "";
  };

  disabledFiletypes.statusline = [
    "fzf"
  ];

  globalstatus = true;

  sections = {
    lualine_a = [
      "mode"
    ];
    lualine_b = [
      "filename"
    ];
    lualine_c = [
      "%="
      "buffers"
    ];
    lualine_x = [
      "searchcount"
    ];
    lualine_y = [
      "filetype"
    ];

    lualine_z = [
      "location"
    ];
  };
}
