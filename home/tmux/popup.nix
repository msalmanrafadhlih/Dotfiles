{ pkgs, ... }:

{
  programs.tmux.extraConfig = ''
    bind w display-popup -d "#{pane_current_path}" -w 30% -h 30% -x 100% -y 14% -E "SAVEFLAKE"

    ##### LazyGit ##### 
    bind C-y display-popup \
      -d "#{pane_current_path}" \
      -w 80% \
      -h 80% \
      -E "lazygit"

    ##### NixOS Rebuild #####
    bind C-y display-popup \
      -w 80% \
      -h 80% \
      -T "System Update"
      -E "SAVEFLAKE"

    bind C-s display-popup -w 60% -h 40% -T " Switch / Create Session " -E " \
      tmux list-sessions -F '#S' | \
      grep -v \"^$(tmux display-message -p '#S')\$\" | \
      fzf --reverse --header 'Enter to Switch | Ctrl-c to Cancel' --print-query | \
      tail -n 1 | \
      xargs -I {} sh -c 'tmux switch-client -t \"{}\" 2>/dev/null || (tmux new-session -d -s \"{}\" && tmux switch-client -t \"{}\")' \
    "     
  
    bind C-p display-popup -E "ipython"
    bind C-f display-popup \
      -w 80% \
      -h 80% \
      -E 'rmpc'
    bind C-r display-popup \
      -d "#{pane_current_path}" \
      -w 90% \
      -h 90% \
      -E "ranger"
    bind C-z display-popup \
      -w 80% \
      -h 80% \
      -E 'nvim ~/.zshrc'
    bind C-g display-popup -E "bash -i ~/.tmux/scripts/chat-popup.sh"
    bind C-t display-popup \
      -d "#{pane_current_path}" \
      -w 75% \
      -h 75% \
      -E "zsh"

    ##### Display Menu ##### 

    bind d display-menu -T "#[align=centre]Dotfiles" -x C -y C \
      ".zshrc"            z  "display-popup -E 'nvim ~/.zshrc'" \
      ".tmux.conf"        t  "display-popup -E 'nvim ~/.tmux.conf'" \
      ".sketchybarrc"     s  "display-popup -d "~/.config/sketchybar" -E 'nvim ~/.config/sketchybar/sketchybarrc'" \
      "Exit"              q  ""

  '';
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "SAVEFLAKE" ''
      #!/usr/bin/env zsh
      # Gunakan zsh agar fitur 'read -k 1' berfungsi

      dir="$HOME/.dotfiles/bspwm"
      # Jika argumen $1 kosong, gunakan "update configs"
      msg=''${1:-"update configs"} 
      # Mengambil tanggal saat ini
      timestamp=$(date "+%Y-%m-%d %H:%M")

      cd "$dir" || { echo "Directory tidak ditemukan!"; exit 1; }

      current_branch=$(git branch --show-current)
      if [ -z "$current_branch" ]; then
          echo "Bukan repo Git!"
          exit 1
      fi

      target_branch=''${2:-$current_branch}

      # Proses Git
      echo "Staging and committing..."
      git add . && git commit -m "$msg | $timestamp" && git push origin "$target_branch"

      # Konfirmasi rebuild
      echo -n "Lanjut rebuild system? (y/n) "
      read -k 1 res
      echo
      if [[ "$res" == "y" || "$res" == "Y" ]]; then
      cd "$HOME/.dotfiles/system" || exit 1
    
      echo "Updating flake and rebuilding..."
      nix flake update dotfiles
      sudo nixos-rebuild switch --flake .#nixos
      fi
    '')
  ];
}
