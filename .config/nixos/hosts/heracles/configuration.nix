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
        address = "192.168.1.42";
        prefixLength = 24;
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

  # Enable k3s
  services.k3s = {
    enable = true;
    role = lib.mkForce "server";
    serverAddr = "https://192.168.1.42:6443";
    tokenFile = config.age.secrets.k3s-token.path;
  };
}
