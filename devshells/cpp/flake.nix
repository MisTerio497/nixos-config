{
  description = "C and C++";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        llvmPkgs = pkgs.llvmPackages_latest;
        buildDir = "build";
        editor = pkgs."zed-editor";
      in
      {
        devShells.default = pkgs.mkShell.override { stdenv = llvmPkgs.stdenv; } {
          buildInputs = with pkgs;[
            llvmPkgs.clang-tools
            cmake
            ninja
            bear
          ];

          packages = [
            editor
          ];
          /* 
          !!!!!!ADD THIS FOR CLANGD WORKS!!!!!!
          
          set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "") 
          if(CMAKE_EXPORT_COMPILE_COMMANDS) 
             set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES}) 
          endif()
          
          */
          shellHook = ''
            rm -rf ${buildDir}
            cmake -GNinja -B ${buildDir} -S .
          '';
        };
      }
    );
}
