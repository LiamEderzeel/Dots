{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      nerdfonts
      font-awesome
      google-fonts
    ];
  };
}
