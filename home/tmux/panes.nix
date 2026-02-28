{ ... }:

{
  programs.tmux.extraConfig = ''
    # Split
    bind | split-window -h -c "#{pane_current_path}"
    bind - split-window -v -c "#{pane_current_path}"
    unbind '"'
    unbind %

    bind x kill-pane

    # Navigation
    bind -n M-a select-pane -L
    bind -n M-d select-pane -R
    bind -n M-w select-pane -U
    bind -n M-s select-pane -D

    # Resize
    bind -n C-M-h resize-pane -L
    bind -n C-M-l resize-pane -R
    bind -n C-M-k resize-pane -U
    bind -n C-M-j resize-pane -D
  '';
}
