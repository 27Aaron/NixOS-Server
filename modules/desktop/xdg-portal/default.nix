{pkgs, ...}: {
  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
