# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../common/server.nix
    ];

  # Define the hostname and static IP address.
  networking = {
    hostName = "athena";
    defaultGateway.interface = "enu1u1";
    interfaces.enu1u1 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.10.117";
        prefixLength = 16;
      }];
    };
    # need to disable firewall to forward traffic
    firewall.enable = false;
  };

  # enable ip forwarding, to act as a Tailscale subnet router
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  # enable tailscale, act as a subnet router for access to VPN
  services.tailscale = {
    enable = true;
    tailscale.useRoutingFeatures = "both";
    tailscale.extraSetFlags = [
      "--advertise-routes=192.168.10.0/24"
    ];
  };

  services.k3s.enable = lib.mkForce false;
}
