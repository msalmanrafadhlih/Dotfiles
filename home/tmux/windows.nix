{ ... }:

{
  programs.tmux.extraConfig = ''
    bind n new-window
    bind , command-prompt "rename-window %%"

    bind -n M-l next-window
    bind -n M-h previous-window
    bind -n C-] next-window
  '';
}
