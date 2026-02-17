{ pkgs, lib, ... }: {  # 1. Menambahkan 'lib' di sini

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/terminal" = [ "kitty.desktop" ];
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.victor-mono
  ];

  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableZshIntegration = true;
      enableBashIntegration = true;
      mode = "no-title no-cwd";
    };

    settings = {
      # 2. PERBAIKAN UTAMA: Menggunakan lib.mkForce dan mengubah ke String
      background_opacity = lib.mkForce "0.5";
      background_blur = 40;

      placement_strategy = "center";
      inactive_text_alpha = "0.6"; # Disarankan pakai string untuk konsistensi di Kitty conf
      confirm_os_window_close = 0;
      tab_bar_style = "powerline";

      window_padding_width = "10";
      window_alert_on_bell = false;
      window_border_width = "3pt";

      hide_window_decorations = true;
      draw_minimal_borders = true;
      enable_audio_bell = false;
      bell_on_tab = "🔔 ";
      remember_window_size = false;

      mouse_hide_wait = 0;
      select_by_word_characters = "@-./_~?&=%+#a";
      copy_on_select = true;

      cursor_trail = 1;
      cursor_shape = "block";
      cursor_stop_blinking_after = 0;
      scrollback_lines = 2000;

      bold_font = "JetBrainsMono NF";
      italic_font = "VictorMono Nerd Font";
      bold_italic_font = "VictorMono Nerd Font";

      # Color scheme: Catppuccin Mocha
      # Source: https://github.com/kovidgoyal/kitty-themes/blob/master/themes/Catppuccin-Mocha.conf
      # The basic colors
      foreground = "#CDD6F4";
      background = "#11111b"; # crust
      selection_foreground = "#1E1E2E";
      selection_background = "#F5E0DC";

      # Cursor
      cursor = "#F5E0DC";
      cursor_text_color = "#1E1E2E";

      # URL underline color when hovering with mouse
      url_color = "#F5E0DC";

      # Kitty window border colors
      active_border_color = "#B4BEFE";
      inactive_border_color = "#6C7086";
      bell_border_color = "#F9E2AF";

      # OS Window titlebar colors
      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      # Tab bar colors
      active_tab_foreground = "#11111B";
      active_tab_background = "#CBA6F7";
      inactive_tab_foreground = "#CDD6F4";
      inactive_tab_background = "#181825";
      tab_bar_background = "#11111B";

      # Colors for marks (marked text in the terminal)
      mark1_foreground = "#1E1E2E";
      mark1_background = "#B4BEFE";
      mark2_foreground = "#1E1E2E";
      mark2_background = "#CBA6F7";
      mark3_foreground = "#1E1E2E";
      mark3_background = "#74C7EC";

      # The 16 terminal colors
      # black
      color0 = "#45475A";
      color8 = "#585B70";

      # red
      color1 = "#F38BA8";
      color9 = "#F38BA8";

      # green
      color2 = "#A6E3A1";
      color10 = "#A6E3A1";

      # yellow
      color3 = "#F9E2AF";
      color11 = "#F9E2AF";

      # blue
      color4 = "#89B4FA";
      color12 = "#89B4FA";

      # magenta
      color5 = "#F5C2E7";
      color13 = "#F5C2E7";

      # cyan
      color6 = "#94E2D5";
      color14 = "#94E2D5";

      # white
      color7 = "#BAC2DE";
      color15 = "#A6ADC8";
    };
  };
}
