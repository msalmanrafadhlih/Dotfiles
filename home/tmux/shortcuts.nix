{ ... }:

{
  programs.tmux.extraConfig = ''
    bind-key ? display-popup -E -w 90% -h 85% "echo '

╔══════════════════════════════════════════╗
║            PURPLELITE TMUX              ║
╚══════════════════════════════════════════╝

PREFIX: Ctrl+z

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 CORE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Ctrl+z r        Reload config
Ctrl+z m        Toggle mouse

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 PANES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Ctrl+z |        Split vertical
Ctrl+z -        Split horizontal
Ctrl+z x        Kill pane

Alt + ← → ↑ ↓   Navigate panes
Ctrl+Alt + ← → ↑ ↓   Resize panes

Ctrl+z z        (default tmux zoom if enabled)

Copy Mode (vi):
v               Begin selection
r               Rectangle toggle
y               Copy to clipboard (xclip)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 WINDOWS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Ctrl+z n        New window
Ctrl+z k        Kill window
Ctrl+z ,        Rename window

Alt + ←         Previous window
Alt + →         Next window
Ctrl + ]        Next window

Alt + 1-5       Change layout

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 SESSIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Ctrl+z N        New session
Ctrl+z K        Kill session (confirm)
Ctrl+z .        Rename session

Alt + ↑         Next session
Alt + ↓         Previous session
Alt + o         Last session

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 POPUPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Ctrl+z l        Lazygit popup
Ctrl+z y        Yazi popup
Ctrl+z w        Floating shell
Ctrl+z s        Session tree (interactive)
Ctrl+z S        Create session (popup prompt)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 PERFORMANCE MODE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Escape-time     0 (instant key response)
History-limit   100000 lines
Aggressive resize enabled
Focus events enabled

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Press q to exit.

' | less"
  '';
}
