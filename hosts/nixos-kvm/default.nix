{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core.nix
    ../../modules/desktop.nix
  ];

  networking.hostName = "nixos-kvm";

  boot.loader = {
    limine = {
      enable = true;
      maxGenerations = 10;
    };

    efi.canTouchEfiVariables = true;
  };

  system.stateVersion = "26.05";
}
