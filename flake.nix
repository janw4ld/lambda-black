{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};

      packageJson = builtins.fromJSON (builtins.readFile ./package.json);
      name = "${packageJson.name}-${packageJson.version}";
      description = packageJson.description;
    in {
      packages.default = self.packages.${system}.lambda-black;
      packages.lambda-black = pkgs.stdenv.mkDerivation {
        inherit name description;
        src = with pkgs.lib.fileset;
          toSource {
            root = ./.;
            fileset = unions [
              ./package.json
              ./themes
              ./img/icon.png
              ./readme.md
              ./changelog.md
              ./LICENSE
            ];
          };
        buildInputs = with pkgs; [nodejs vsce];

        buildPhase = ''vsce package'';
        installPhase = ''install -Dm755 -t "$out" ${name}.vsix'';

        meta = {
          description = "VSCode extension: ${description}";
          homepage = "https://github.com/janw4ld/lambda-black";
          license = pkgs.lib.licenses.mit;
        };
      };
    });
}
