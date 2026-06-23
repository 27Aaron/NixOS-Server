{inputs, ...}: {
  hm'.imports = [
    inputs.noctalia.homeModules.default
  ];

  hm'.programs.noctalia-shell = {
    enable = true;
    systemd.enable = false;
  };

  hm'.xdg.configFile."niri/noctalia.kdl".text = ''
    spawn-at-startup "noctalia-shell"

    window-rule {
      geometry-corner-radius 20
      clip-to-geometry true
    }

    debug {
      honor-xdg-activation-with-invalid-serial
    }

    layer-rule {
      match namespace="^noctalia-overview*"
      place-within-backdrop true
    }
  '';

  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  preservation'.user.directories = [".config/noctalia"];
}
