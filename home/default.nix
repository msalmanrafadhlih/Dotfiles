# ./home/default.nix
{ 
 imports = [
  ./bspwm
  # ./btm
  ./fastfetch
  # ./zen-browser
  # ./firefox
  ./zed-editor
  ./gemini
  ./gtk
  ./spotify
  ./helix
  ./inlyne # Markdown Viewer
  ./kitty
  ./lazygit
  # ./nwg-drawer # Aplikasi Menu Launcher bergaya drawer
  # ./rofi
  ./serpl # tui find and replace tool, good for integratinng with terminal editors
  ./shell
  ./stylix
  ./starship # Mengubah tampilan Prompt (shell)
  ./virtmanager  
  # ./wezterm
  ./yazi
  # ./zathura # Document Viewer
  # ./yazelix
  # ./zellij
	# ./bspwm/polybar 
	# ./bspwm/sxhkd 
	# ./picom 
	# ./rofi 
	# ./dunst 
	# ./eww 
	# ./nano 
	./tmux 
	./rmpc 
	# ./ncmpcpp 
	./btop 
	# ./com.kdocker 
	# ./gtk-3.0
	# ./ghostty 
 #  ./alacritty 
 ];
}
