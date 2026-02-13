{ pkgs, ... }:

{
  # Bootloader
	boot = {
		plymouth = {
			enable = true;
			theme = "Bloodrage"; # default = spinner, breeze, fade-in, nixos, solar
			themePackages = [ pkgs.Bloodrage-plymouth ];
			extraConfig = "";
			# logo = pkgs.fetchurl {
			# 	url = "https://raw.githubusercontent.com/Melkor333/nixos-boot/refs/heads/main/src/evil-nixos.png";
			# 	sha256 = "sha256-U/NgApBDrc40Q5VZkq4iuzEdOuR6Ne5QvpHbxJjg+iU=";
			# };
		};
		consoleLogLevel = 0; # set level log kernel (0=sepi, 7=verbose)
		kernelParams = [
			# untuk cek log,
			# hapus quit dan log_level=7 jika error,
			"quiet" 
			"splash"
			"rd.systemd.show_status=0"
			"udev.log_level=3" 
		];
	};

  boot.loader.timeout = 2;
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.systemd-boot.configurationLimit = 3;

	boot.initrd = {
		verbose = false; # matikan output initrd
		kernelModules = [
			"i915" # intel
			# "amdgpu" # amd
			# "nvidia-drm.modeset=1" # nvidia
		];
	};
}
