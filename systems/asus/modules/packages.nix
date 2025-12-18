{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  programs.amnezia-vpn.enable = true;
  services.hardware.openrgb.enable = true;
  environment.systemPackages = with pkgs; [
    pciutils
    age
    rar
    libsecret
    efibootmgr
    agenix
    fastfetch
    tree
    git
    openssl
    curl
    wget
  ];
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [

    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly"; # Default value
    };
  };
}
