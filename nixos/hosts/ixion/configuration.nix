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
    hostName = "ixion";
    defaultGateway.interface = "end0";
    interfaces.end0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.10.43";
        prefixLength = 16;
      }];
    };
  };

  services.k3s = {
    role = lib.mkForce "agent";
    extraFlags = lib.mkForce "";
  };
}
