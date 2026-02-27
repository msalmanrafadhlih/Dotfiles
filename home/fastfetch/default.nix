{ config, dotfiles, ... }:

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  home = config.home.homeDirectory;
  dotfiles_path = "${home}/.dotfiles/${dotfiles}/home/fastfetch";
  configs = {
		"fastfetch/ascii" = "ascii";
		"fastfetch/gifs" = "gifs";
		"fastfetch/pngs" = "pngs";
  };
in

{
  xdg.configFile = builtins.mapAttrs (name: subpath: {source =
    create_symlink "${dotfiles_path}/${subpath}";
    recursive = true;
  }) configs;

  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "~/.config/fastfetch/ascii/miku";
        type = "none"; 
        width = 30;
        height = 15;
        padding.left = 3;
      };

      modules = [
        "break"
        {
          type = "custom";
          format = "\\u001b[33m┌──────────────────────Hardware──────────────────────┐";
        }
        {
          type = "host";
          key = "󰌢 PC";
          keyColor = "red";
          format = "{name} [{serial}]";
        }
        {
          type = "cpu";
          key = "│ ├";
          keyColor = "red";
        }
        {
          type = "gpu";
          key = "│ ├󰍛";
          keyColor = "red";
        }
        {
          type = "memory";
          key = "│ ├󰍛";
          keyColor = "red";
        }
        {
          type = "disk";
          key = "└ └";
          keyColor = "red";
        }
        {
          type = "custom";
          format = "\\u001b[33m└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "\\u001b[33m┌──────────────────────Software──────────────────────┐";
        }
        {
          type = "os";
          key = " OS";
          keyColor = "green";
        }
        {
          type = "kernel";
          key = "│ ├";
          keyColor = "green";
        }
        {
          type = "bios";
          key = "│ ├";
          keyColor = "green";
        }
        {
          type = "packages";
          key = "│ ├󰏖";
          keyColor = "green";
        }
        {
          type = "terminal";
          key = "│ ├";
          keyColor = "green";
        }
        {
          type = "shell";
          key = "└ └";
          keyColor = "green";
        }
        "break"
        {
          type = "theme";
          key = "󱏂 DE";
          keyColor = "blue";
        }
        {
          type = "wm";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "wmtheme";
          key = "│ ├󰉼";
          keyColor = "blue";
        }
        {
          type = "font";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "cursor";
          key = "└ └󰆿";
          keyColor = "blue";
        }
        {
          type = "custom";
          format = "\\u001b[33m└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "\\u001b[33m┌───────────────────Connectivity────────────────────┐";
        }
        {
          type = "publicip";
          key = "󰌘 ┌󰩟";
          keyColor = "cyan";
          format = "{1} - {2}";
        }
        {
          type = "localip";
          key = "│ ├󰩟";
          keyColor = "cyan";
          format = "{1} - {3}";
          showMac = true;
        }
        {
          type = "dns";
          key = "│ ├󰮌";
          keyColor = "cyan";
        }
        {
          type = "wifi";
          key = "│ ├󰑩";
          keyColor = "cyan";
          format = "{4} - {7} - {13} GHz - {6} - {10}";
        }
        {
          type = "bluetooth";
          key = "│ ├󰥰";
          keyColor = "cyan";
          format = "{1} - {4}";
        }
        {
          type = "bluetoothradio";
          key = "└ └󰂯";
          keyColor = "cyan";
          format = "{5}";
        }
        {
          type = "custom";
          format = "\\u001b[33m└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "\\u001b[33m┌───────────────────Miscellaneous────────────────────┐";
        }
        {
          type = "uptime";
          key = " ┌";
          keyColor = "magenta";
        }
        {
          type = "command";
          # Menggunakan bash karena fish mungkin tidak ada di environment tertentu
          text = "echo \"$(cat /sys/class/power_supply/BAT0/capacity)%\"";
          key = "│ ├";
          keyColor = "magenta";
        }
        {
          type = "media";
          key = "│ ├";
          keyColor = "magenta";
          format = "{1} - {3} ({5}) [{#magenta}{player-name}{#}]";
        }
        {
          type = "datetime";
          key = "│ ├";
          keyColor = "magenta";
          format = "{23}-{4}-{1} {14}:{18}:{20} {22}";
        }
        {
          type = "locale";
          key = "└ └";
          keyColor = "magenta";
        }
        "break"
        {
          type = "custom";
          format = "  Whenever there's a meeting, a parting shall follow.";
          outputColor = "cyan";
        }
        {
          type = "custom";
          format = "\\u001b[33m└────────────────────────────────────────────────────┘";
        }
        { 
          type = "colors"; 
          paddingLeft = 20; 
          symbol = "star"; 
        }
      ];
    };
  };
}
