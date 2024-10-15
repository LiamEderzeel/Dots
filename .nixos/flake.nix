# /etc/nixos/flake.nix
{
  description = "multi-machine system flake";
  inputs = {
    # NOTE: Replace "nixos-23.11" with that which is in system.stateVersion of
    # configuration.nix. You can also use latter versions if you wish to
    # upgrade.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };
  outputs = {
    self,
  nixpkgs,
  # nixos-boot,
  ...
  } @ inputs: let
    pkgs = import nixpkgs {
    inherit system;
    overlays = [
      # inputs.nur.overlay
    ];

    config = {
      allowUnfree = true;
      # allowUnfreePredicate = _: true;
    };
  };

  stateVersion = "24.05"; 
    username = "liamederzeel"; 
    desktop = "machine"; 
    laptop = "lisa"; 
    system = "x86_64-linux"; # Rarely, change system architecture
    email = "liamederzeel@gmail.com"; # your email for Git and such 
    # discord = "aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTI1NDEyMDE3ODA3NDEyODQ5Ni9jdklWWVlfZURGMXRLcmR1aHJRW"; # Change/ remove
    in {
      #  NixOS configuration entrypoint
      #  Available through 'nixos-rebuild --flake .# your-hostname'
      nixosConfigurations = {
        ${desktop} = nixpkgs.lib.nixosSystem {
          specialArgs = let
            hostname = "${desktop}";  in {
              inherit
                inputs
                self
                username
                system
                stateVersion
                email
                # discord
                hostname;
            };
          # Our main nixos configuration file <
          modules = [./${desktop}/configuration.nix];
          # modules = [./nixos/${desktop}/configuration.nix nixos-boot.nixosModules.default];
        };
        ${laptop} = nixpkgs.lib.nixosSystem { 
          specialArgs = let hostname = "${laptop}";  in {
            inherit
              inputs
              self
              username
              system
              stateVersion
              email
              # discord
              hostname;
          };
          # Our main nixos configuration file <
          modules = [./${laptop}/configuration.nix];
          # modules = [./nixos/${laptop}/configuration.nix nixos-boot.nixosModules.default];
        };
      };
  };
}

    # overlays = import ./overlays {inherit inputs;};
    # # NOTE: 'nixos' is the default hostname set by the installer
    # nixosConfigurations.machine = nixpkgs.lib.nixosSystem {
    #   # NOTE: Change this to aarch64-linux if you are on ARM
    #   system = "x86_64-linux";
    #   modules = [ ./configuration.nix ];
    # };
