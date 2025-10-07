{
  description = "Ruby + Jekyll development shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs =
    { self, nixpkgs }:
    {
      devShells.aarch64-darwin.default =
        let
          pkgs = import nixpkgs { system = "aarch64-darwin"; };
        in
        pkgs.mkShell {
          name = "jekyll-env";
          buildInputs = [
            pkgs.ruby_3_3
            pkgs.jekyll
            pkgs.clang
            pkgs.make
            pkgs.pkg-config
            pkgs.libffi
            pkgs.zlib
            pkgs.openssl
          ];

          shellHook = ''
            export GEM_HOME=$PWD/.gems
            export PATH="$GEM_HOME/bin:$PATH"
            echo "💎 Ruby + Jekyll dev shell ready"
          '';
        };
    };
}
