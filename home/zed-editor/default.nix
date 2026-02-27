{ lib, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;

    # Daftar Ekstensi yang otomatis di-install
    extensions = [ 
      "nix" 
      "toml" 
      "elixir" 
      "make" 
      "lua" 
      "python" 
      "rust" 
      "typescript" 
      "marksman"
      "css" 
      "scss"
      "kotlin"
      "java" 
      "xml"
      "sql"
      "jsons"
      "bash" # Untuk Shell/Zsh script
    ];

    userSettings = {
      active_pane_modifiers = {
        border_size = 0.1; # Default 0.0
        inactive_opacity = 0.5;
      };
      bottom_dock_layout = "contained"; # contained, full, left_aligned, right_aligned
      allow_rewrap = "in_comments"; # in_comments, in_selections, anywhere
      auto_indent = true;
      auto_indent_on_paste = true;
      autosave = "off";
      autoscroll_on_clicks = false;
      auto_signature_help = false;
      auto_update = false;
      base_keymap = "VSCode";
      # buffer_font_family = ".ZedMono";
      buffer_font_size = lib.mkForce 8;
      buffer_font_weight = 400; # Default 400
      buffer_line_height = "comfortable";
      centered_layout = {
        left_padding = 0.2;
        right_padding = 0.2;
      };
      close_on_file_delete = false;
      confirm_quit = true;
      diagnostics_max_severity = "all"; # all, error, warning, info, hint
      disable_ai = false;
      load_direnv = "direct"; # shell_hook, direct, disabled
      double_click_in_multibuffer = "select"; # slect, open

      vim_mode = false;
      helix_mode = true;
      show_whitespaces = "all";
      current_line_highlight = "gutter";
      ui_font_size = lib.mkForce 10;
      # Tetap pakai mkForce karena konfigurasi sistem lain mungkin mencoba mengubah ini

      node = {
        path = lib.getExe pkgs.nodejs;
        npm_path = lib.getExe' pkgs.nodejs "npm";
      };

      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        copy_on_select = false;
        dock = "bottom";
        load_direnv = "shell_hook";
        base_keymap = "VSCode";
        detect_venv = {
          on = {
            directories = [ ".env" "env" ".venv" "venv" ];
            activate_script = "default";
          };
        };
        # env = {};
        font_family = "FiraCode Nerd Font";
        line_height = "comfortable";
        shell = "system";
        toolbar = {
          breadcrumbs = true;
        };
        working_directory = "current_project_directory";
      };
    };
  };
}
