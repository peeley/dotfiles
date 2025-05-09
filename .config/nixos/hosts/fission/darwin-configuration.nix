{ pkgs, lib, ... }:

{
  imports = [
    ../../common/configuration.nix
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    terminal-notifier
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix.extraOptions = ''
    system = aarch64-darwin
    extra-platforms = aarch64-darwin x86_64-darwin
    experimental-features = nix-command flakes
    build-users-group = nixbld

    keep-outputs = true
    keep-derivations = true
  '';

  users.users.bodo = {
    name = "bodo";
    home = "/Users/bodo";
  };

  # enable homebrew package manager
  homebrew.enable = true;

  # homebrew packages to install
  homebrew.casks = [
    "firefox"
    "slack"
    "steam"
    "jellyfin-media-player"
    "calibre"
    "tailscale"
    "retroarch"
    "obsidian"
    "1password"
    "emacs-mac"
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # trackpad
  system.defaults.trackpad = {
    Clicking = true;
    TrackpadRightClick = true;
  };

  # disable scroll acceleration
  # system.defaults.".GlobalPreferences"."com.apple.scrollwheel.scaling" = -1.0;
}
