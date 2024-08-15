
# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      ../../common/server.nix
      ./hardware-configuration.nix
      (modulesPath + "/virtualisation/proxmox-image.nix")
    ];

  # override values from server.nix, which assumes server is a RasPi
  boot.loader.grub = {
    enable = lib.mkForce true;
    device = "/dev/vda";
  };

  boot.loader.generic-extlinux-compatible.enable = lib.mkForce false;

  # Define the default gateway and DNS server.
  networking = {
    usePredictableInterfaceNames = true;
    hostName = "anubis";
    defaultGateway.interface = "ens18";
    interfaces.ens18 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.1.12";
        prefixLength = 24;
      }];
    };
  };

  # Enable k3s
  services.k3s = {
    enable = true;
    role = lib.mkForce "server";
    serverAddr = "https://192.168.1.42:6443";
    tokenFile = config.age.secrets.k3s-token.path;
  };

  proxmox.qemuConf = {
    diskSize = "32768";
    name = "anubis";
    cores = 4;
    memory = 8192;
  };
}
