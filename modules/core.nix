{ pkgs, ... }:

{
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  users.users.onez3r0 = {
    isNormalUser = true;

    extraGroups = [
      "wheel"
      "networkmanager"
    ];

    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  services.openssh = {
    enable = true;
    openFirewall = true;

    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    btop
    pciutils
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];
  };
}
