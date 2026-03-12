# ./home/default.nix
{ inputs, ... }:
{ 
 imports = [
  ./Apps
  ./bspwm
  ./bat
  ./fastfetch
  ./zed-editor
  ./gemini
  ./git
  ./gtk
  ./spotify
  ./helix
  ./kitty
  ./lazygit
  ./serpl # tui find and replace tool, good for integratinng with terminal editors
  ./shell
  ./stylix
  ./starship # Mengubah tampilan Prompt (shell)
  ./virtmanager  
  ./yazi
	./vesktop
	./com.kdocker
	./mpd
	./nano 
	./tmux 
	./rmpc 
	./btop 
	./xytz # TUI Youtube downloader and Streaming
	./xdg-portal
	./suckless
  # ./zen-browser
  # ./firefox
  # ./nwg-drawer # Aplikasi Menu Launcher bergaya drawer
  # ./wezterm
  # ./zathura # Document Viewer
  # ./yazelix
  # ./zellij
  # ./btm
	# ./ncmpcpp 
  # ./inlyne # Markdown Viewer
	# ./gtk-3.0
	# ./ghostty 
  # ./alacritty 

  inputs.stylix.homeModules.stylix
 ];
}
