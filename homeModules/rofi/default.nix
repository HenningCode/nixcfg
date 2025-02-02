{
  pkgs,
  ...
}: {
  
  # programs.rofi = {
  #   enable = true;
  #   package = pkgs.rofi-wayland;
  # };
  home.packages = with pkgs; [rofi-wayland];

  xdg.configFile."rofi/config.rasi".text = ''
     configuration {
        font: "JetBrains Mono 10";
        show-icons: true;
        icon-theme: "Gruvbox-Plus-Dark";

        display-ssh:    "󰣀 ssh:";
        display-run:    "󱓞 run:";
        display-drun:   "󰣖 drun:";
        display-window: "󱂬 window:";
        display-combi:  "󰕘 combi:";
        display-filebrowser: "󰉋 filebrowser:";

        dpi: 120;
    }

    @theme "gruvbox-material"
  '';

  xdg.configFile."rofi/gruvbox-material.rasi".text = ''
    /**
     * Gruvbox rofi theme
     *
     * Color palette imported from https://github.com/sainnhe/gruvbox-material
     *
     */

    * {
    	gruv0: #282828;
    	gruv1: #32302f;
    	gruv2: #45403d;
    	gruv3: #5a524c;

    	gruv4: #fbf1c7;
    	gruv5: #f4e8be;
    	gruv6: #eee0b7;

    	gruv7: #a89984;
    	gruv8: #928374;
    	gruv9: #4c6f64;
    	gruv10: #504945;
    	red: #ea6962;

    	orange: #e78a4e;
    	yellow: #d8a657;
    	aqua: #89b482;
    	purple: #d3869b;

        reddark: #c14a4a;
        yellowdark: #b47109;

        foreground:  @gruv9;
        background-color:  transparent;
    
        highlight: underline bold #eee0b7;

        transparent: rgba(46,52,64,0);

    }

    window {
        location: center;
        anchor:   center;
        border-radius: 20px;
        height: 560px;
        width: 460px;

        background-color: @transparent;
        spacing: 0;
        children:  [mainbox];
        orientation: horizontal;
    }

    mainbox {
        spacing: 0;
        children: [ inputbar, message, listview ];
    }

    message {
        padding: 10px;
        border:  0px 2px 2px 2px;
        border-color: @gruv0;
        background-color: @gruv7;
    }

    inputbar {
        color: @gruv6;
        padding: 14px;
        background-color: @gruv0;
        border-color: @gruv0;

        border: 1px;
        border-radius: 10px 10px 0px 0px;
    }

    entry, prompt, case-indicator {
        text-font: inherit;
        text-color: inherit;
    }

    prompt {
        margin: 0px 1em 0em 0em ;
    }

    listview {
        padding: 8px;
        border-radius: 0px 0px 10px 10px;
        border: 2px 2px 2px 2px;
        border-color: @gruv0;
        background-color: @gruv0;
        dynamic: false;
    }

    element {
        padding: 5px;
        vertical-align: 0.5;
        border-radius: 10px;
        color: @foreground;
        text-color: @gruv6;
        background-color: @gruv1;
    }

    element.normal.active {
        background-color: @yellow;
    }

    element.normal.urgent {
        background-color: @reddark;
    }

    element.selected.normal {
        background-color: @gruv7;
        text-color: @gruv0;
    }

    element.selected.active {
        background-color: @yellowdark;
    }

    element.selected.urgent {
        background-color: @red;
    }

    element.alternate.normal {
        background-color: @transparent;
    }

    element-text, element-icon {
        size: 4.5ch;
        margin: 0 10 0 0;
        vertical-align: 0.5;
        background-color: inherit;
        text-color: @gruv6;
    }

    button {
        padding: 6px;
        color: @foreground;
        horizontal-align: 0.5;

        border: 2px 0px 2px 2px;
        border-radius: 10px;
        border-color: @foreground;
    }

    button.selected.normal {
        border: 2px 0px 2px 2px;
        border-color: @foreground;
    }
  '';
}
