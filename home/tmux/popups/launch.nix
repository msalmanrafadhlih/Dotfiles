{
  programs.tmux.extraConfig = ''
    ##### NIXOS REBUILD ####
    bind w display-popup \
      -w 50% -h 50% \
      -x 100% -y 14% \
      -T " NixOS Rebuild " \
      -E "$SHELL -ic 'SAVEFLAKE; echo -e \"\033[1;32mPress Enter to close...\033[0m\"; read'"

    ###### Session Manager (Switch, Create, Delete)
    bind C-s display-popup \
      -w 50% -h 30% \
      -x C -y 20 \
      -T " Session Manager " \
      -E "tmux-session-manager"

    # lazygit
    set-option -g command-alias[119] 'lazygit=display-popup \
      -d "#{pane_current_path}" \
      -w 90% \
      -h 80% \
      -T " Git " \
      -E "lazygit"'

    set-option -g command-alias[120] 'xytz=display-popup \
      -w 100 \
      -h 25 \
      -T " Yuutube Downloader + Stream ++ " \
      -E "xytz"'

    set-option -g command-alias[121] 'ranger=display-popup \
      -d "#{pane_current_path}" \
      -w 90% \
      -h 90% \
      -T " Ranger " \
      -E "nix run nixpkgs#ranger"'

    set-option -g command-alias[122] 'mate=display-popup \
      -d "#{pane_current_path}" \
      -w 52 -h 90% \
      -x R -y 100% \
      -T "#[align=center] AI Agent " \
      -E "ai-chat"'

    set-option -g command-alias[123] 'gemini=display-popup \
      -d "#{pane_current_path}" \
      -w 50% -h 90% \
      -x R -y 100% \
      -T "#[align=center] Gemini AI " \
      -E "gemini"'

    set-option -g command-alias[124] 'scratchpad=display-popup \
      -d "#{pane_current_path}" \
      -T "#[align=center] Scratchpad "\
      -w 60% -h 30% -x C -y 5 \
      -E "$SHELL"'

    set-option -g command-alias[125] 'scratchpad2=display-popup \
      -d "#{pane_current_path}" \
      -T "#[align=center] Scratchpad "\
      -w 90% -h 90% -x C -y C \
      -E "$SHELL"'
   '';
}
