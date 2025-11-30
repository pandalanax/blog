{
  description = "Jekyll development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Ruby environment
            ruby_3_4
            bundler

            # Jekyll and common dependencies
            jekyll

            # Build tools that Jekyll gems might need
            gcc
            gnumake

            # Additional utilities
            git
            nodejs-slim
            imagemagick
            exiftool
          ];

        };
      }
    );
}
