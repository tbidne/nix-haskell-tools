{ pkgs
, find-hs-non-build
}:

pkgs.writeShellScript "ormolu.sh" ''
  dir=.
  cabal="--cabal-default-extensions"
  args=()
  while [ $# -gt 0 ]; do
    if [[ $1 == "--dir" ]]; then
      dir=$2
      shift
    elif [[ $1 == "--no-cabal" ]]; then
      cabal=""
    else
      args+=($1)
    fi
    shift
  done
  ${find-hs-non-build} | xargs ${pkgs.ormolu}/bin/ormolu $cabal ''${args[@]}
''
