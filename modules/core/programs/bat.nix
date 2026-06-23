{pkgs, ...}: {
  hm'.programs.bat = {
    enable = true;
    themes = {
      RosePine = {
        src = pkgs.fetchFromGitHub {
          owner = "drluckyspin";
          repo = "rose-pine-bat";
          rev = "5f10349e9ff32cd60d28debc3fa71fe6f5470c34";
          sha256 = "sha256-FpUgVQ7vx9iY7TkPsu2cMRQyaY8ZDswVHVpSNqXRtfU=";
        };
        file = "themes/Rose-Pine.tmTheme";
      };
    };
    config = {
      # pager = "less -FR";
      theme = "RosePine";
    };
  };
}
