# ./modules/xsession.nix
{

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "vivaldi";
    TERMINAL = "st";
  };

  xsession = {
    enable = true;
    windowManager.command = "bspwm";

    # Tambahan script sebelum menjalankan WM (setara isi .xinitrc kamu)
    initExtra = ''
            [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
      	    eval "$(dbus-launch --sh-syntax)"
      	    export DBUS_SESSION_BUS_ADDRESS
            xsetroot -cursor_name left_ptr	    

        		mpDris2 &
    '';
  };
  # export XCURSOR_THEME=Kafka
  # export XCURSOR_SIZE=14
  # xsetroot -cursor_name left_ptr
}
