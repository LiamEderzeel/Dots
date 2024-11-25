{ pkgs,
  pkgs-unstable,
  username,
 ...}:
let
  themes = pkgs.callPackage  ./configs/sddm-themes.nix {};
  unstable = with pkgs-unstable; [
    ferdium
    spotify
    lazygit
    lazydocker
    nodePackages."@antfu/ni"
    nodejs_22
  ];
  stable = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    wlr-randr
    neovim
    tmux
    git
    openssh
    hyprland 
    hyprpaper
    waybar
    waypaper
    firefox-wayland 
    alacritty 
    rofi-wayland
    keyd
    dolphin
    gnome.nautilus
    xwayland
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    neofetch
    nix-prefetch-git
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    fzf
    ripgrep
    wl-clipboard
    killall
    pulseaudio
    hyprlock
    pavucontrol
    wev # xevents to see keyboard and mouse events
    brightnessctl
    eza
    networkmanagerapplet
    btop
    slurp
    grim
    cinnamon.nemo-with-extensions   
    vlc
    mpv
    kitty
    ranger
    lf
    gwenview
    gcc
    node2nix
    nixd
    docker
    kubectl
    kubeseal
    doctl
    transmission
    transmission-gtk
    python3
    playerctl
    inkscape
    themes.where-is-my-sddm-theme
    lua-language-server
    xz
    exfat
    gnome.gnome-disk-utility
    docker-compose
    unzip
    jq
    weston
  ];
in
{
  environment.systemPackages = stable ++ unstable;
}
