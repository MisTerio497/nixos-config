{
  username,
  hostname,
  pkgs,
  ...
}:
let
  deploy = "sh /home/${username}/nixos-config/deploy.sh";
in
{
  programs.fish = {
    enable = true;
    shellAliases = {
      helix = "hx";
      zed = "zeditor";

      cls = "clear";
      ll = "ls -la";
      f="fastfetch";

      re = "sudo nixos-rebuild switch --flake ~/nixos-config#${hostname} --impure && ${deploy}";
      up = "home-manager switch --flake ~/nixos-config#${username}";
      sys = "zeditor ~/nixos-config";
    };
    interactiveShellInit = ''
      set -U fish_greeting ""
    '';
  };
}
