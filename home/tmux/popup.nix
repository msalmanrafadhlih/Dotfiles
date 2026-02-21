{ ... }:

{
  programs.tmux.extraConfig = ''
    bind l display-popup -d "#{pane_current_path}" -w 80% -h 80% -E "lazygit"
    bind y display-popup -d "#{pane_current_path}" -w 80% -h 80% -E "yazi"
    bind w display-popup -d "#{pane_current_path}" -w 70% -h 70% -E "$SHELL"

    bind s choose-tree -Zs

    bind S display-popup -w 60% -h 30% -E 'bash -c "read -p \"Session name: \" name; tmux new-session -d -s $name && tmux switch-client -t $name"'
  '';
}
