{...}: {
  programs.yazi = {
    enable = true;
    settings = {
      # log = {
      #   enabled = false;
      # };
      manager = {
        show_hidden = true;
        # sort_by = "modified";
        # sort_dir_first = true;
        # sort_reverse = true;
        layout = [2 3 5];
      };
      input = {
        find_origin = "bottom-left";
        find_offset = [0 2 50 3];
      };
    };
    theme = {
      status = {
        separator_open = "█";
        separator_close = "█";
      };

      # input = {
      #   border = {fg = "black";};
      # };
    };
  };
}
