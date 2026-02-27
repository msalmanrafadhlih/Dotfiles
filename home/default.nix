# ./home/default.nix
{ 
 imports = [
  ./bspwm
  ./fastfetch
  ./zed-editor
  ./gemini
  ./gtk
  ./spotify
  ./helix
  ./inlyne # Markdown Viewer
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
	./nano 
	./tmux 
	./rmpc 
	./btop 
  # ./zen-browser
  # ./firefox
  # ./nwg-drawer # Aplikasi Menu Launcher bergaya drawer
  # ./wezterm
  # ./zathura # Document Viewer
  # ./yazelix
  # ./zellij
  # ./btm
	# ./ncmpcpp 
	# ./gtk-3.0
	# ./ghostty 
 #  ./alacritty 
 ];
}
