# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./configuration.nix
    ];

  # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;

  # required for k3s
  boot.kernelParams = [
    "cgroup_enable=cpuset" "cgroup_memory=1" "cgroup_enable=memory"
  ];

  # Define the default gateway and DNS server.
  networking = {
    defaultGateway = {
      address = "192.168.1.1";
    };
    nameservers = [
      "192.168.1.1"
    ];
  };

  virtualisation.docker.enable = true;

  age.secrets.admin-password-hash.file = ../secrets/admin-password-hash.age;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPasswordFile = config.age.secrets.admin-password-hash.path;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    bind
    k3s
    nfs-utils
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable tailscale
  services.tailscale.enable = true;

  # Disable the firewall altogether.
  networking.firewall.enable = false;

  # Decrypt the k3s token
  age.secrets.k3s-token.file = ../secrets/k3s-token.age;

  # Enable k3s
  services.k3s = {
    enable = true;
    role = "agent";
    serverAddr = "https://192.168.1.42:6443";
    tokenFile = config.age.secrets.k3s-token.path;
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
