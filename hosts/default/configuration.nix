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

  boot.supportedFilesystems = ["ntfs"];
  services.logind.extraConfig = "HandlePowerKey=ignore";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

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

  hardware.sane = {
    enable = true;
    extraBackends = [pkgs.hplipWithPlugin];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["amdgpu"];
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

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
      discord
      seafile-client
    ];
  };

  fonts.packages = with pkgs; [nerd-fonts.jetbrains-mono];

  # Install additonal programs.
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
    tmux
    zellij
    sqlite
    killall
    pulseaudio
    pavucontrol
    simple-scan
    heroic
    gparted
    obsidian
  ];

  programs.thunar.enable = true;
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  environment.variables = {
    LIBSQLITE = "${pkgs.sqlite.out}/lib/libsqlite3.so";
  };

  services.openssh.enable = true;

  programs.ssh.askPassword = "";

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users."henning" = {
      imports = [
        ./home.nix
      ];
    };
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
    image = ../../homeModules/hypr/mountain.jpg;
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sizes = {
        applications = 10;
        terminal = 13;
        desktop = 10;
        popups = 10;
      };
    };
  };

  ###################
  # DO NOT CHANGE!! #
  ###################
  system.stateVersion = "24.11";
}
