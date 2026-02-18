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
      "html" 
      "css" 
      "kotlin" 
      "java" 
      "bash" # Untuk Shell/Zsh script
    ];

    userSettings = {
      vim_mode = false;
      helix_mode = true;
      show_whitespaces = "all";
      current_line_highlight = "gutter";
      ui_font_size = lib.mkForce 10;
      editor_font_size = lib.mkForce 8;
      # Tetap pakai mkForce karena konfigurasi sistem lain mungkin mencoba mengubah ini
      buffer_font_size = lib.mkForce 10;

      node = {
        path = lib.getExe pkgs.nodejs;
        npm_path = lib.getExe' pkgs.nodejs "npm";
      };

      hour_format = "hour24";
      auto_update = false;

      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        copy_on_select = false;
        dock = "bottom";
        detect_venv = {
          on = {
            directories = [ ".env" "env" ".venv" "venv" ];
            activate_script = "default";
          };
        };
        env = {
          TERM = "st"; # Pas untuk setup suckless kamu
        };
        font_family = "FiraCode Nerd Font";
        line_height = "comfortable";
        shell = "system";
        toolbar = {
          title = true;
        };
        working_directory = "current_project_directory";
      };

      # Konfigurasi LSP: Memaksa Zed mencari binary di system path (PATH)
      lsp = {
        rust-analyzer = { binary = { path_lookup = true; }; };
        nixd = { binary = { path_lookup = true; }; }; # LSP Nix favorit di NixOS
        lua-language-server = { binary = { path_lookup = true; }; };
        pyright = { binary = { path_lookup = true; }; };
        typescript-language-server = { binary = { path_lookup = true; }; };
        vscode-html-language-server = { binary = { path_lookup = true; }; };
        vscode-css-language-server = { binary = { path_lookup = true; }; };
        kotlin-language-server = { binary = { path_lookup = true; }; };
        jdtls = { binary = { path_lookup = true; }; };
        bash-language-server = { binary = { path_lookup = true; }; };
        elixir-ls = {
          binary = { path_lookup = true; };
          settings = { dialyzerEnabled = true; };
        };
      };

      languages = {
        "Nix" = { language_servers = [ "nixd" ]; };
        "Lua" = { language_servers = [ "lua-language-server" ]; };
        "TypeScript" = { language_servers = [ "typescript-language-server" ]; };
        "JavaScript" = { language_servers = [ "typescript-language-server" ]; };
        "Python" = { language_servers = [ "pyright" ]; };
        "Bash" = { language_servers = [ "bash-language-server" ]; };
        "Zsh" = { language_servers = [ "bash-language-server" ]; };
        
        "Elixir" = {
          language_servers = [ "elixir-ls" ];
          format_on_save = {
            external = {
              command = "mix";
              arguments = [ "format" "--stdin-filename" "{buffer_path}" "-" ];
            };
          };
        };
      };

      load_direnv = "shell_hook";
      base_keymap = "VSCode";
    };
  };
}
