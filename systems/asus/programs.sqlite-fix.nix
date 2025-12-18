{ inputs, pkgs }:
{
  programs.command-not-found.enable = true;
  programs.command-not-found.dbPath = inputs.flake-programs-sqlite.packages.${pkgs.system}.programs-sqlite;
}