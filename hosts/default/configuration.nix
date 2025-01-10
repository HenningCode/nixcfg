# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  inputs,
  ...
}: let
in {
  imports = [
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix
    ../../nixosModules/hyprland.nix
  ];
  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 30;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  networking.hostName = "nixos"; # Define your hostname.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable networking
  networking.networkmanager.enable = true;
  # services.getty.autologinUser = "henning";

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.henning = {
    isNormalUser = true;
    description = "Henning";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      ueberzugpp
      alacritty
      discord
      seafile-client
      nwg-look
    ];
  };

  fonts.packages = with pkgs; [nerd-fonts.jetbrains-mono];

  # Install additonal programs.
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    starship
    tree
    sqlite
    fastfetch
    wl-clipboard
    yazi
    tmux
    sqlite
    molly-guard
  ];

  environment.variables = {
    LIBSQLITE = "${pkgs.sqlite.out}/lib/libsqlite3.so";
  };

  services.openssh.enable = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users."henning" = {
      imports = [
        ./home.nix
      ];
    };
  };

  ###################
  # DO NOT CHANGE!! #
  ###################
  system.stateVersion = "24.11";
}
