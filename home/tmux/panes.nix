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
    bind-key Left select-pane -L
    bind-key Right select-pane -R
    bind-key Up select-pane -U
    bind-key Down select-pane -D

    # Resize
    bind -n C-M-Left resize-pane -L
    bind -n C-M-Right resize-pane -R
    bind -n C-M-Up resize-pane -U
    bind -n C-M-Down resize-pane -D

    # Copy mode
    set -g mouse on
    setw -g mode-keys vi
    bind-key -T copy-mode-vi v send -X begin-selection
    bind-key -T copy-mode-vi r send -X rectangle-toggle
    bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "xclip -selection clipboard -in"

    # Mouse Clipboard Copy
    unbind -T copy-mode-vi MouseDragEnd1Pane
    bind -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "xclip -selection clipboard -in"

    set -g set-clipboard on
    set -g allow-passthrough on
  '';
}
