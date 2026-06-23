{pkgs, ...}: {
  hm'.home.packages = with pkgs; [
    firefox
    fuzzel
    xwayland-satellite
  ];

  preservation'.user.directories = [".config/niri"];

  programs.niri = {
    enable = true;
  };
}
