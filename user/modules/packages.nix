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
    # inputs.zen-browser.packages.${pkgs.system}.default
    # inputs.winapps.packages.${pkgs.system}.winapps
    # (blender.override {
    #   cudaSupport = true;
    # })
    # (pkgs.callPackage ./../pkgs/davinci-resolve-paid.nix  {})
    # (pkgs.callPackage ./../pkgs/xmcl.appimage.nix  {})
    # (pkgs.wrapProgram pkgs.zoom-us {
    #   extraEnv = {
    #     CURSOR_THEME = "Breeze";
    #     XCURSOR_SIZE = "24";
    #   };
    # })
    
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
