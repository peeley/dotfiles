{ config, lib, modulesPath, pkgs, ... }:

{
  imports =
    [
      ../../common/server.nix
      ./hardware-configuration.nix
    ];

  boot.loader.grub = {
    enable = lib.mkForce true;
    device = "/dev/sda";
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  boot.loader.generic-extlinux-compatible.enable = lib.mkForce false;

  # Define the default gateway and DNS server.
  networking = {
    usePredictableInterfaceNames = false;
    hostName = "seth";
    defaultGateway.interface = "eth0";
    interfaces.eth0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.10.14";
        prefixLength = 16;
      }];
    };
  };

  services.k3s = {
    role = lib.mkForce "agent";
    extraFlags = lib.mkForce ''
      --node-label video-hardware=true
    '';
  };

  disko.devices = {
    disk.ssd = {
      device = "/dev/sda";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            size = "1M";
            type = "EF02";
          };
          ESP = {
            size = "1G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };
          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
        };
      };
    };
  };
}
