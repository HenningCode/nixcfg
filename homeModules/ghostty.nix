{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
  };
}
