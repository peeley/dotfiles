{ config, pkgs, lib, ... }:

let
  user = "guest";
  password = "guest";
  hostname = "heracles";
in {

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  networking = {
    hostName = hostname;
    interfaces."eth0".ipv4.addresses = [{
      address = "192.168.1.42";
      prefixLength = 24;
    }];
  };

  environment.systemPackages = with pkgs; [ vim ];

  services.openssh.enable = true;
  services.sshd.enable = true;

  users = {
    mutableUsers = false;
    users."${user}" = {
      isNormalUser = true;
      password = password;
      extraGroups = [ "wheel" ];
    };
  };

  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "23.11";
  services.tailscale.enable = true;
}
