{ ... }:

{
  programs.tmux.extraConfig = ''
    bind n new-window
    bind k kill-window
    bind , command-prompt "rename-window %%"

    bind -n M-Right next-window
    bind -n M-Left previous-window
    bind -n C-] next-window

    bind -n M-1 select-layout even-horizontal
    bind -n M-2 select-layout even-vertical
    bind -n M-3 select-layout main-horizontal
    bind -n M-4 select-layout main-vertical
    bind -n M-5 select-layout tiled
  '';
}
