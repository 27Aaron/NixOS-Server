{
  imports = [
    ./hardware.nix
  ];

  services' = {
    vnstat.enable = true;
    openssh.enable = true;
    fail2ban.enable = true;
    networkmanager.enable = true;
  };

  security'.firewall.enable = true;
}
