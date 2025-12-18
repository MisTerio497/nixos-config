{
  username,
  hostname,
  pkgs,
  ...
}:
let
  deploy = "sh /home/${username}/nix-config/deploy.sh";
in
{
  programs.fish = {
    enable = true;
    shellAliases = {
      zed = "zeditor";
      cls = "clear";
      ll = "ls -la";
      re = "sudo nixos-rebuild switch --flake ~/nix-config#${hostname} --impure && ${deploy}";
      up = "home-manager switch --flake ~/nix-config#${username}";
      helix = "hx";
    };
    interactiveShellInit = ''
      set -U fish_greeting ""
    '';
  };
}
