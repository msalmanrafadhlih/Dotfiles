{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    # Mengganti prefix default C-b ke C-z
    prefix = "C-z";
    # Mengatur mode navigasi ke VI (untuk copy mode)
    keyMode = "vi";
    # Indeks mulai dari 1 (biar sesuai urutan angka di keyboard)
    baseIndex = 1;
    # Support mouse secara default
    mouse = true;
    # Menggunakan shell default (opsional, sesuaikan jika ingin spesifik)
    # shell = "${pkgs.zsh}/bin/zsh";
    
    # Terminal settings
    terminal = "tmux-256color";

    extraConfig = ''
      # RGB/True color support
      set -as terminal-features ",tmux-256color:RGB"
      set-option -g focus-events on
      
      # Status bar tweak (Double line status)
      set-option -g status "on"
      set -g 'status-format[1]' '''
      set -g status 2
      set-option -g status-position top

      # --- KEYBINDINGS ---
      # Copy mode VI (Yank to xclip)
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "${pkgs.xclip}/bin/xclip -in -selection clipboard"

      # Reload config
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"

      # Toggle mouse
      bind m set -g mouse \; display-message "Mouse: #{?mouse,on,off}"

      # Pane Management
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %
      bind x kill-pane

      # Navigasi Pane (Alt + Arrow)
      bind-key Left select-pane -L
      bind-key Right select-pane -R
      bind-key Up select-pane -U
      bind-key Down select-pane -D

      # Resize Pane (Ctrl + Alt + Arrow)
      bind -n C-M-Left resize-pane -L 2
      bind -n C-M-Right resize-pane -R 2
      bind -n C-M-Up resize-pane -U 2
      bind -n C-M-Down resize-pane -D 2

      # Window Management
      bind n new-window
      bind k kill-window
      bind , command-prompt "rename-window %%"
      
      # Ganti Window (Alt + Arrow / Ctrl + ])
      bind -n M-Right next-window
      bind -n M-Left previous-window
      bind -n C-] next-window
      unbind "p"
      unbind "l"

      # Session Management
      bind-key N command-prompt -p "New session name:" "new-session -s '%%'"
      bind-key K confirm-before -p "Kill session #S? (y/n)" kill-session
      bind . command-prompt -I "#S" "rename-session '%%'"
      
      # Switch Session (Alt + Up/Down)
      unbind [
      bind -n M-Down switch-client -p
      bind -n M-Up switch-client -n

      # --- THEME (Purplelite) ---
      set -g message-style fg=black,bg=magenta,bold
      set-option -g pane-border-style fg='magenta'
      set-option -g pane-active-border-style fg='green'
      set-option -g status-fg 'black'
      set-option -g status-bg 'default'
      set-option -g mode-style fg='black',bg='blue'
      set-window-option -g clock-mode-colour 'magenta'
      set-option -g status-style fg='black',bg='default'

      # Windows Style
      set-window-option -g window-status-style fg=white,bg=default
      set-window-option -g window-status-activity-style bg=default,fg=colour248
      set-window-option -g window-status-current-style fg='#D3C6AA',bg=red

      # Status Bar Formatting
      set-option -g status-left-style none
      set -g status-left-length 60
      set -g status-left '''

      set-option -g status-right-style none
      set -g status-right-length 120
      set -g status-right '#[fg=magenta]#[fg=default,bg=magenta] #[fg=white,bg=black] #W #[fg=magenta]#[fg=default,bg=magenta] #[fg=white,bg=black] #{p:pane_current_path} #[fg=green]#[fg=default,bg=green] #[fg=white,bg=black] #S '

      set -g window-status-separator "#[bg=default] "
      set -g window-status-current-format "#[fg=white,bg=black] #W #[fg=black,bg=blue] #I#[fg=blue,bg=default]"
      set -g window-status-format "#[fg=white,bg=black] #W #[fg=black,bg=yellow] #I#[fg=yellow,bg=default]"
    '';

    plugins = with pkgs.tmuxPlugins; [
      sensible # Rekomendasi standar untuk Nix
      # Anda tidak butuh tpm secara manual, Nix yang akan mengaturnya
      # Contoh jika ingin nambah plugin lain:
      # {
      #   plugin = ressurrect;
      #   extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      # }
    ];
  };

  # Memastikan xclip tersedia untuk copy-paste
  home.packages = [ pkgs.xclip ];
}
