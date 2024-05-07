# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../common/raspi.nix
    ];

  # Define the hostname and static IP address.
  networking = {
    hostName = "athena";
    interfaces.end0 = {
      ipv4.addresses = [{
        address = "192.168.1.117";
        prefixLength = 24;
      }];
    };
  };
}
