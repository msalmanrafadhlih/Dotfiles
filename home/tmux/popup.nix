{
  programs.tmux.extraConfig = ''
    ##### NIXOS REBUILD ####
    bind w display-popup \
      -w 50% -h 50% \
      -x 100% -y 14% \
      -T " NixOS Rebuild " \
      -E "$SHELL -ic 'SAVEFLAKE; echo -e \"\033[1;32mPress Enter to close...\033[0m\"; read'"

    ##### LazyGit #####
    bind y display-popup \
      -d "#{pane_current_path}" \
      -w 90% \
      -h 80% \
      -T " Git " \
      -E "lazygit"

    ##### Btop++ #####
    unbind C-b
    bind C-b display-popup \
      -w 100 \
      -h 35 \
      -T " Btop ++ " \
      -E "btop -p 1"

    ##### Youtube #####
    bind C-y display-popup \
      -w 100 \
      -h 25 \
      -T " Yuutube Downloader + Stream ++ " \
      -E "xytz"

    ###### Session Manager (Switch, Create, Delete)
    bind C-s display-popup \
      -w 50% -h 30% \
      -x C -y 20 \
      -T " Session Manager " \
      -E "tmux-session-manager"

    ###### Ranger
    bind C-r display-popup \
      -d "#{pane_current_path}" \
      -w 90% \
      -h 90% \
      -T " Ranger " \
      -E "nix run nixpkgs#ranger"

    #### Chat Ai ######
    bind C-a display-popup \
      -d "#{pane_current_path}" \
      -w 52 -h 90% \
      -x R -y 100% \
      -T "#[align=center] AI Agent " \
      -E "$SHELL -ic '~/.local/bin/Chat-Ai; read'"

    #### GeminiAi ######
    bind C-g display-popup \
      -d "#{pane_current_path}" \
      -w 50% -h 90% \
      -x R -y 100% \
      -T "#[align=center] Gemini AI " \
      -E "gemini"

    #### Scratchpad #######
    bind C-t display-popup \
      -d "#{pane_current_path}" \
      -T "#[align=center] Scratchpad "\
      -w 60% -h 30% -x C -y 5 \
      -E "$SHELL"

    #### Scratchpad 2 #######
    bind C-p display-popup \
      -d "#{pane_current_path}" \
      -T "#[align=center] Scratchpad "\
      -w 90% -h 90% -x C -y C \
      -E "$SHELL"
   '';
}
