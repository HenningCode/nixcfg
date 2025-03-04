{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding = {
        x = 10;
        y = 5;
      };
      # font = {
      #   size = 13;
      #   normal = {
      #     family = "JetBrainsMonoNerdFont";
      #     style = "Regular";
      #   };
      # };
      # colors = {
      #   primary = {
      #     foreground = "#d4be98";
      #     background = "#282828";
      #   };
      #   selection = {
      #     text = "#32302f";
      #     background = "#32302f";
      #   };
      #   cursor = {
      #     cursor = "#a89984";
      #     text = "#32302f";
      #   };
      #   normal = {
      #     black = "#928374";
      #     red = "#ea6962";
      #     green = "#a9b665";
      #     yellow = "#e78a4e";
      #     blue = "#7daea3";
      #     magenta = "#d3869b";
      #     cyan = "#89b482";
      #   };
      #   bright = {
      #     black = "#d4be98";
      #     red = "#ea6962";
      #     green = "#a9b665";
      #     yellow = "#d8a657";
      #     blue = "#7daea3";
      #     magenta = "#d3869b";
      #     cyan = "#89b482";
      #     white = "#d4be98";
      #   };
      # };
    };
  };
}
