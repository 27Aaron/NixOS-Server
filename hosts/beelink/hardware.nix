{
  lib,
  pkgs,
  config,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # Platform
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Boot
  boot'.systemd-boot.enable = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];

    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "thunderbolt"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];
  };

  # Hardware
  hardware'.disko = {
    enable = true;
    luks.enable = true;
    device = "/dev/nvme0n1";
  };

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
