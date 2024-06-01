
# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ../../common/server.nix
      # (modulesPath + "/virtualisation/proxmox-image.nix")
    ];

  # override values from server.nix, which assumes server is a RasPi
  boot.loader.grub.enable = lib.mkForce true;
  boot.loader.generic-extlinux-compatible.enable = lib.mkForce false;

  # proxmox = {
  #   cores = 4;
  #   memory = 8192;
  #   diskSize = 32 * 1024;
  #   name = "thoth";
  # };

  # Define the default gateway and DNS server.
  networking = {
    usePredictableInterfaceNames = true;
    hostName = "thoth";
    interfaces.ens18 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.1.11";
        prefixLength = 24;
      }];
    };
  };
}
