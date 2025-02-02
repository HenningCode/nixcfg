{...}: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      window-decoration = false;
    };
  };
}
