{ ... }:

{
  programs.tmux.extraConfig = ''
    set -s escape-time 0
    set -g history-limit 100000
    setw -g aggressive-resize on
    set -g focus-events on
    set -g display-time 4000

    # Pastikan environment variable terminal diteruskan
    # RGB support
    set -g default-terminal "tmux-256color"
    set -ga terminal-features ",*:RGB"
    set -ga terminal-features ",*:sixel"
  '';
}
