{
  pkgs,
  config,
  ...
}: let
  user = config.core'.userName;
in {
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.niri}/bin/niri-session";
        inherit user;
      };
      default_session = initial_session;
    };
  };
}
