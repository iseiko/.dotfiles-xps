{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in

{
  imports =
    [ 
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];

    home-manager.useUserPackages = true;
    home-manager.useGlobalPkgs = true;
    home-manager.backupFileExtension = "backup";
    home-manager.users.iseiko = import ./home.nix;
    #home.enableNixpkgsReleaseCheck = false;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-36ef4bf1-ada5-4406-84c3-9d82e16f0d68".device = "/dev/disk/by-uuid/36ef4bf1-ada5-4406-84c3-9d82e16f0d68";

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "ryujin"; 

  # Enable networking
  # networking.wireless.iwd.enable = true;
  networking.networkmanager.enable = false;
  networking.wireless.enable = false;  

   networking.wireless.iwd = {
     enable = true;
     settings = {
       Settings = {
        AutoConnect = true;
       };
     };
   };


  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.ly.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.niri.enable = true;

  services.logind.settings.Login.HandleLidSwitch = "suspend-then-hibernate";
  services.logind.settings.Login.HandleLidSwitchExternalPower = "suspend"; 

  environment.variables.EDITOR = "nvim";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support 
  services.libinput.enable = true;

  users.users."iseiko" = {
    isNormalUser = true;
    description = "iseiko";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  vim 
  wget
  neovim
  kitty
  zsh
  fastfetch
  niri
  waybar
  vscode
  rofi
  nerd-fonts.fira-code
  noto-fonts
  nerd-fonts.jetbrains-mono
  swaybg
  impala
  bluetui
  playerctl
  bluez
  pavucontrol
  fzf
  oh-my-posh
  zoxide
  eza
  git
  man
  man-db
  man-pages
  texinfo
  localsend
  brightnessctl
  bat
  imagemagick
  stremio-linux-shell
  hyprlock
  pkgs.jdk21
  nautilus
  qutebrowser
  gnome-tweaks
  bibata-cursors
  #cisco-packet-tracer_9
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Fira Code Nerd Font" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  system.stateVersion = "26.11";
}
