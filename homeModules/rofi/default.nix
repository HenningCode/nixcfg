{
  pkgs,
  ...
}: {

  programs.rofi = {
    enable = true;
    theme = ./gruvbox-material.rasi;
    extraConfig = ''
    show-icons: true;
    font: "JetBrains Mono 12";
    icon-theme: "Papirus-Dark";

    display-ssh:    "󰣀 ssh:";
    display-run:    "󱓞 run:";
    display-drun:   "󰣖 drun:";
    display-window: "󱂬 window:";
    display-combi:  "󰕘 combi:";
    display-filebrowser: "󰉋 filebrowser:";

    dpi: 120;
'';

    
  };
}
