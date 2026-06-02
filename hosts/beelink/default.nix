{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
  ];

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
}
