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

  # Define the gateway and DNS server.
  networking = {
    hostName = "heracles";
    defaultGateway.interface = "end0";
    interfaces.end0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.10.42";
        prefixLength = 16;
      }];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    papermc
  ];

  # Enable Minecraft server
  systemd.services.minecraft = {
    enable = true;
    description = "Lauren and Noah's Minecraft server!";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.papermc}/bin/minecraft-server";
      ExecStop = "pkill minecraft-server";
      WorkingDirectory="/opt/minecraft";
    };
    wantedBy = [ "multi-user.target" ];
  };

  services.k3s = {
    role = lib.mkForce "agent";
    extraFlags = lib.mkForce ''
      --node-label zigbee=true
    '';
  };
}
