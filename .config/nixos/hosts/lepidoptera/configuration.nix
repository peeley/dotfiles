# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../../common/configuration.nix
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;

  networking.hostName = "lepidoptera"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.networkmanager.wifi.macAddress = "permanent";

  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable i3 as our desktop environment.
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    displayManager.defaultSession = "xfce+i3";

    windowManager.i3 = {
      package = pkgs.i3-gaps;
      enable = true;
      extraPackages = with pkgs; [
        rofi
        i3lock
      ];
    };
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bodo = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "audio" "video" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      tree
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    emacs
    wget
    firefox
    tailscale
    spotify
    jellyfin-media-player
    discord
    pavucontrol
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-whiskermenu-plugin
    bintools-unwrapped
    rofi
    networkmanagerapplet
    playerctl
  ];

  programs.steam.enable = true;
  hardware.steam-hardware.enable = true;

  programs.git = {
    enable = true;
  };

  programs.light.enable = true;

  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:

  services.tailscale.enable = true;
  services.mullvad-vpn.enable = true;

  location = {
    provider = "manual"; 
    latitude = 34.052235; 
    longitude = -118.243683;
  };

  services.redshift.enable = true;

  # Disable the firewall altogether.
  networking.firewall.enable = false;

  # enable docker
  virtualisation.docker.enable = true;

  # enable virtualbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "bodo" ];

  # allow emulation of ARM 64-bit
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
  ];

  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
    };
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

