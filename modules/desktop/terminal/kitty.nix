{pkgs, ...}: {
  hm'.programs.kitty = {
    enable = true;
    themeFile = "rose-pine";

    font = {
      name = "Maple Mono NF CN";
      size = 10;
    };

    settings = {
      hide_window_decorations = "titlebar-only";
      window_padding_width = 10;

      mouse_hide_wait = 2;
      url_color = "#0087bd";
      url_style = "dotted";
      confirm_os_window_close = 0;
      background_opacity = "0.95";

      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };
  };
}
