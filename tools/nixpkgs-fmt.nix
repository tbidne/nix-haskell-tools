{ pkgs }:

pkgs.writeShellScript "nixpkgs-fmt.sh" ''
  args=()
  dir=.
  while [ $# -gt 0 ]; do
    if [[ $1 == "--nh-help" ]]; then
      echo "usage: nix run github:tbidne/nix-hs-tools#nixpkgs-fmt -- [--dir PATH] <args>"
      exit 0
    elif [[ $1 == "--dir" ]]; then
      dir=$2
      shift 1
    else
      args+=($1)
    fi
    shift
  done

  ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt $dir ''${args[@]}
''
