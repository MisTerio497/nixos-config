{ pkgs,
  lib,
  ...
}:
let
  DE = lib.strings.toLower (builtins.getEnv "XDG_CURRENT_DESKTOP");
in
{
  fonts.fontconfig.enable = true;

  programs = {
    chromium.enable = true;
  };

  home.packages =
    with pkgs;
    [
      vlc
      prismlauncher
      figma-linux
      jetbrains.webstorm
      jetbrains.clion
      _64gram
    ]
    ++ lib.optionals (lib.strings.hasInfix "kde" DE) (with pkgs; [
      qbittorrent
      krita
      libreoffice-qt6
      hunspellDicts.ru_RU
      hunspellDicts.en_EN
    ])
    ++ lib.optionals (lib.strings.hasInfix "gnome" DE) (with pkgs; [
      fragments
    ]);
}
