{
  pkgs,
  ...
}

programs.helix = {
  enable = true;
  theme = "gruvbox";
  editor = {
    line-number = "relative";
    lsp.display-messages = true;
  }
  
}
