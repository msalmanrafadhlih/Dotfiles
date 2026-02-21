{
  imports = [ ./tmux-sessions.nix ];
  programs.tmux.extraConfig = ''
    ##### NIXOS REBUILD ####
    bind w display-popup \
      -w 90% -h 90% \
      -E "$SHELL -ic 'SAVEFLAKE; read'"

    ##### LazyGit ##### 
    bind C-y display-popup \
      -d "#{pane_current_path}" \
      -w 80% \
      -h 80% \
      -E "lazygit"

    ###### Session Manager (Switch, Create, Delete)
    bind C-s display-popup \
      -w 60% -h 40% -T " Session Manager " \
      -E "tmux-session-manager"  

    ###### Ranger
    bind C-r display-popup \
      -d "#{pane_current_path}" \
      -w 90% \
      -h 90% \
      -T " Ranger " \
      -E "nix run nixpkgs#ranger"

    bind C-g display-popup \
      -E "bash -i ~/.tmux/scripts/chat-popup.sh"

    bind C-t display-popup \
      -d "#{pane_current_path}" \
      -w 30% -h 30% -x 100% -y 14% \
      -E "$SHELL"

    ########################
    ##### Display Menu ##### 

    bind C-m display-menu -T "#[align=centre] DevShell " -x C -y C \
      "Mobile Dev"         1  "$SHELL -ic 'yazi ~/.repos/MobileDevelopment'" \
      "Rust Dev"           2  "$SHELL -ic 'yazi ~/.repos/RustDevelopment'" \
      "Web Dev"            3  "$SHELL -ic 'yazi ~/.repos/WebDevelopment'" \
      "Exit"               q  ""
  '';
}
