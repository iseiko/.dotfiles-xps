{ config, pkgs, ... }:
{
  programs.gnome-shell = {
    enable = true;
    extensions = [
    { package = pkgs.gnomeExtensions.dash-to-dock; }
    { package = pkgs.gnomeExtensions.blur-my-shell; }
    ];
  };
}
