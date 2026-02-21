{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    mouse = true;

    plugins = with pkgs.tmuxPlugins; [
      tpm
    ];

    extraConfig = ''
      # Prefix
      unbind C-b
      set -g prefix C-z
      bind C-z send-prefix

      # Base index start from 1
      set -g base-index 1
      set -g pane-base-index 1

      # Reload config
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"

      # RGB support
      set -as terminal-features ",tmux-256color:RGB"
    '';
  };

  imports = [
    ./performance.nix
    ./panes.nix
    ./windows.nix
    ./sessions.nix
    ./popup.nix
    ./theme.nix
    ./shortcuts.nix
  ];
}
