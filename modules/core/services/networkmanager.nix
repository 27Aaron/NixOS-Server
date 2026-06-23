{
  lib,
  config,
  ...
}: let
  cfg = config.services'.networkmanager;
  user = config.core'.userName;
in {
  options.services'.networkmanager = {
    enable = lib.mkEnableOption "Enable NetworkManager for network connection management";
  };

  config = lib.mkIf cfg.enable {
    networking.networkmanager.enable = true;

    # Grant the main user connection-management rights without root: members
    # of the `networkmanager` group are authorized by Polkit to edit NM.
    users.users.${user}.extraGroups = ["networkmanager"];

    # Persist NetworkManager connection profiles so WiFi/Ethernet configs
    # survive reboots on the impermanence-based system.
    preservation'.os.directories = [
      "/var/lib/NetworkManager"
      "/etc/NetworkManager/system-connections"
    ];
  };
}
