{ username, ... }:

{
	services.openssh.enable = true;
	services.tailscale.enable = true;
	services.openssh = {
		startWhenNeeded = true;
		settings.PasswordAuthentication = false;
		settings.PermitRootLogin = "no";
		settings.KbdInteractiveAuthentication = false;
		settings.AllowUsers = [ username ];
	};
	## using mosh
	programs.mosh.enable = true;
}
