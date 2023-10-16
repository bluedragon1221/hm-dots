# TODO: better keyboard mappings for nvim-cmp
{
  enable = true;

  autoEnableSources = true;

  sources = [
    {name = "nvim_lsp";}
    {name = "path";}
  ];

  mapping = {
    "<CR>" = "cmp.mapping.confirm({ select = true })";
  };

  preselect = "Item";
  snippet.expand = "vsnip";
}
