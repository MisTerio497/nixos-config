{
  pkgs,
  inputs,
  username,
  ...
}:
{
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs = {
    # mpv.enable = true;
    chromium.enable = true;
    # direnv.enable = true;
  };

  home.packages = with pkgs; [
    vlc
    prismlauncher
    figma-linux

    handbrake

    # jetbrains-toolbox
    # jetbrains.idea-community-bin
    jetbrains.webstorm
    jetbrains.clion

    _64gram
    
    libreoffice-qt6
    hunspellDicts.ru_RU
    
    # fragments
    qbittorrent
    krita
  ];
}
