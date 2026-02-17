{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      # Palette dihapus agar Stylix bisa mengambil kendali penuh

      format = ''
        [](purple)[](bg:purple fg:black)[](bg:blue fg:purple)$directory$git_branch$git_status$git_state$rust$golang$nodejs$lua$nix_shell$dart$haskell$julia$python$elm$elixir$scala$aws$docker_context$package$cmd_duration
        $character
      '';

      character = {
        success_symbol = "[──❯](bold purple)[❯](bold blue)[❯](bold green)";
        error_symbol = "[──❯❯❯](bold red)";
      };

      directory = {
        read_only = " ";
        format = "[ $path](bg:blue fg:black)[$read_only](bg:blue fg:red)[](blue) ";
        truncation_length = 10;
        truncate_to_repo = true;
      };

      cmd_duration = {
        min_time = 4;
        show_milliseconds = false;
        disabled = false;
        style = "bold italic cyan";
        format = "[\\(](bold italic blue)[$duration]($style)[\\)](bold italic blue)";
      };

      # Icons & Symbols
      aws.symbol = "  ";
      conda.symbol = " ";
      dart.symbol = " ";

      docker_context = {
        symbol = " ";
        format = "via [$symbol$context]($style) ";
        style = "blue bold";
        only_with_files = true;
        detect_files = [ "docker-compose.yml" "docker-compose.yaml" "Dockerfile" ];
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
      };

      git_status = {
        style = "bold purple";
        format = "([\\[$all_status$ahead_behind\\]]($style) )";
        stashed = "[\${count}*](green)";
        modified = "[\${count}+](yellow)";
        deleted = "[\${count}-](red)";
        conflicted = "[\${count}~](red)";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        untracked = "[\${count}?](blue)";
        staged = "[\${count}+](green)";
      };

      git_state = {
        style = "bold purple";
        format = "[$state( $progress_current/$progress_total) ]($style)";
      };

      # Language Settings
      python = {
        symbol = "🐍 ";
        format = "via [\${symbol}python (\${version} )(\\(\${virtualenv}\\) )]($style)";
        style = "bold yellow";
      };

      nodejs = {
        format = "via [󰎙 Node.js $version](bold green) ";
        detect_files = [ "package.json" ".node-version" ];
        detect_folders = [ "node_modules" ];
      };

      # Symbols Only
      elixir.symbol = " ";
      elm.symbol = " ";
      golang.symbol = " ";
      lua.symbol = "󰢱 ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      haskell.symbol = "λ ";
      nix_shell.symbol = " ";
      package.symbol = " ";
      rust.symbol = " ";
    };
  };
}
