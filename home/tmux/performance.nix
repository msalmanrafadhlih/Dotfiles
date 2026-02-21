{ ... }:

{
  programs.tmux.extraConfig = ''
    set -s escape-time 0
    set -g history-limit 100000
    setw -g aggressive-resize on
    set -g focus-events on
    set -g display-time 4000

    set -g allow-passthrough on
    set -as terminal-features ',st-256color:sixel'
    set -as terminal-overrides ',st-256color:Sxl'
    # Pastikan environment variable terminal diteruskan
    set -ga update-environment TERM
    set -ga update-environment TERM_PROGRAM
  '';
}
