# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;
    version = 2;
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "nodev"; # or "nodev" for efi only

  networking.hostName = "mammon"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp6s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable XFCE as our desktop environment.
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.defaultSession = "xfce";

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
  #
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Use pipewire for sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bodo = {
     isNormalUser = true;
     extraGroups = [ "wheel" "docker" "audio" "video" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
    openrgb
  ];

  programs.steam.enable = true;
  hardware.steam-hardware.enable = true;

  programs.git = {
    enable = true;
  };

  programs.zsh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  services.tailscale.enable = true;
  services.mullvad-vpn.enable = true;

  location = {
    provider = "manual"; 
    latitude = 34.052235; 
    longitude = -118.243683;
  };
  services.redshift.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  # networking.firewall.checkReversePath = "loose";
  networking.networkmanager.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

  fonts.fonts = with pkgs; [
    dina-font
    proggyfonts
    julia-mono
    gohufont
  ];

  # add local NFS server
  fileSystems."/mnt/nfs" = {
    device = "192.168.1.64:/volume1/Media";
    fsType = "nfs";
  };

  # enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}

