# {
#   description = "A flake with Proxmox VE enabled";
#
#   inputs = {
#     nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
#     proxmox-nixos.url = "github:SaumonNet/proxmox-nixos";
#   };
#
#   outputs = { self, nixpkgs, proxmox-nixos, ...}: {
#     nixosConfigurations = {
#       yourHost = nixpkgs.lib.nixosSystem rec {
#         system = "x86_64-linux";
#         modules = [
#
#           proxmox-nixos.nixosModules.proxmox-ve
#
#           ({ pkgs, lib, ... }: {
#             services.proxmox-ve.enable = true;
#             nixpkgs.overlays = [
#               proxmox-nixos.overlays.${system}
#             ];
#
#             # The rest of your configuration...
#           })
#         ];
#       };
#     };
#   };
# }

{ config, pkgs, hostname, username, overylays, ... }:
{
  imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
  ];

  networking.hostName = "${hostname}"; 
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  users.users.${username} = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      nvim
      tmux
      zsh
    ];
  };

  services.openssh.enable = true;
  services.proxmox-ve.enable = true;
  nixpkgs = {
    config.allowUnfree = true;
    overlays = overylays;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
