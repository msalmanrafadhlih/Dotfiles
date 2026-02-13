{
  services = {
  	journald = {
		storage = "persistent";
		extraConfig = ''
			RuntimeMaxUse=50M
			SystemMaxUse=100M
			MaxRetentionSec=14day
			SystemMaxFileSize=10M
		'';
  	};
  };
}
