{pkgs, ...}: {
  gtk = {
    enable = true;

    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-material-gtk-theme;
    };

    iconTheme = {
      name = "GruvboxPlus";
      package = pkgs.gruvbox-plus-icons;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
}
