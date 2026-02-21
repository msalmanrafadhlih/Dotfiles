{
  programs.tmux.extraConfig = ''
    ##### NIXOS REBUILD ####
    bind w display-popup \
      -d "#{pane_current_path}" \
      -w 30% -h 30% -x 100% -y 14% \
      -E "$SHELL -ic 'SAVEFLAKE; read'"

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
      -T "System Update" \
      -E "SAVEFLAKE"

    bind C-s display-popup -w 60% -h 40% -T " Switch / Create Session " -E " \
      tmux list-sessions -F '#S' | \
      grep -v \"^$(tmux display-message -p '#S')\$\" | \
      fzf --reverse --header 'Enter to Switch | Ctrl-c to Cancel' --print-query | \
      tail -n 1 | \
      xargs -I {} sh -c 'tmux switch-client -t \"{}\" 2>/dev/null || (tmux new-session -d -s \"{}\" && tmux switch-client -t \"{}\")' \
    "     

    # Session Manager (Switch, Create, Delete)
    bind C-; display-popup \
      -w 60% -h 40% -T " Session Manager " \
      -E "tmux-session-manager"  

    bind C-r display-popup \
      -d "#{pane_current_path}" \
      -w 90% \
      -h 90% \
      -E "ranger"

    bind C-g display-popup \
      -E "bash -i ~/.tmux/scripts/chat-popup.sh"

    bind C-t display-popup \
      -d "#{pane_current_path}" \
      -w 30% -h 30% -x 100% -y 14% \
      -E "$SHELL"

    ##### Display Menu ##### 

    bind d display-menu -T "#[align=centre] Dotfiles " -x C -y C \
      "Mobile Dev"         1  "$SHELL -ic 'yazi ~/.repos/MobileDevelopment'" \
      "Rust Dev"           2  "$SHELL -ic 'yazi ~/.repos/RustDevelopment'" \
      "Web Dev"            3  "$SHELL -ic 'yazi ~/.repos/WebDevelopment'" \
      "Exit"               q  ""
  '';
}
