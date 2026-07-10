{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/virtualisation/proxmox-image.nix")
  ];

  options = {
    customModules.proxmox.enable = lib.mkEnableOption "Enable Proxmox settings for homelab VMs";
  };

  config = lib.mkIf config.customModules.proxmox.enable {
    proxmox = {
      qemuConf = {
        diskSize = 65536;
        name = config.networking.hostname;
        cores = 4;
        memory = 8192;
      };

      cloudInit.enable = false;
    };
  };
}
