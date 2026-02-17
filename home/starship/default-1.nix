{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      # Baris 1: Icon Nix(Blue) -> User(Magenta) -> DirIcon(Cyan) -> Path(Yellow) -> Git
      # Baris 2: Character (Green/Red)
      format = ''
        [ ](bold blue)[$username](bold magenta) [$directory](bold yellow)$git_branch$git_status$git_state$rust$golang$nodejs$lua$nix_shell$python
        $character'';

      username = {
        show_always = true;
        style_user = "bold magenta";
        format = "[$user]($style) ";
      };

      directory = {
        # Menggunakan simbol Cyan sebelum path Yellow
        format = "[ ](bold cyan)[$path]($style)[$read_only]($read_only_style) ";
        style = "bold yellow";
        # Starship secara otomatis mengganti $HOME dengan simbol ini
        home_symbol = "";
        truncation_length = 3;
        truncate_to_repo = true;
      };

      character = {
        # Identik dengan %(?.%B%F{green}.%F{red}) di Zsh kamu
        success_symbol = "[](bold green) ";
        error_symbol = "[](bold red) ";
      };

      # Pembersihan Git agar tetap minimalis (tanpa background)
      git_branch = {
        symbol = " ";
        style = "bold purple";
        format = "on [$symbol$branch]($style) ";
      };

      git_status = {
        style = "bold purple";
        format = "([[$all_status$ahead_behind]]($style) )";
      };

      # Menghilangkan teks "via" yang terlalu panjang agar rapi seperti Zsh
      python = {
        symbol = "🐍 ";
        format = "[$symbol($version )]($style)";
        style = "bold yellow";
      };

      nodejs = {
        symbol = "󰎙 ";
        format = "[$symbol($version )]($style)";
        style = "bold green";
      };

      nix_shell = {
        symbol = " ";
        format = "[$symbol]($style)";
        style = "bold blue";
      };
    };
  };
}
