{ config, pkgs, lib, hostname, username, system, proxmox-nixos, ... }:
{
  imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # ./vms/lab1vm1.nix
  ];

  boot.loader.systemd-boot.enable = true;

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
      lazygit
    ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    tmux
    zsh
    git
    proxmox-ve
    btop
  ];

  programs.zsh.enable = true;

  services.openssh.enable = true;
  services.proxmox-ve.enable = true;

  # TODO: does not work right now
  # services.proxmox-ve = {
  #   enable = true;
  #   vms = {
  #     vm1 = {
  #       vmid = 100;
  #       memory = 4096;
  #       cores = 4;
  #       sockets = 2;
  #       kvm = false;
  #       net = [
  #         {
  #           model = "virtio";
  #           bridge = "vmbr0";
  #         }
  #       ];
  #       scsi = [ { file = "local:128"; } ];
  #     };
  #     # myvm2 = {
  #     #   vmid = 101;
  #     #   memory = 8192;
  #     #   cores = 2;
  #     #   sockets = 2;
  #     #   scsi = [ { file = "local:32"; } ];
  #     # };
  #   };
  # };

  systemd.network.networks."10-lan" = {
      matchConfig.Name = [ "ens18" ];
      networkConfig = {
      Bridge = "vmbr0";
      };
  };

  systemd.network.netdevs."vmbr0" = {
    netdevConfig = {
      Name = "vmbr0";
      Kind = "bridge";
    };
  };

  systemd.network.networks."10-lan-bridge" = {
    matchConfig.Name = "vmbr0";
    networkConfig = {
    IPv6AcceptRA = true;
    DHCP = "ipv4";
    };
    linkConfig.RequiredForOnline = "routable";
  };

  networking.bridges.vmbr0.interfaces = [ "ens18" ];
  networking.interfaces.vmbr0.useDHCP = lib.mkDefault true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
