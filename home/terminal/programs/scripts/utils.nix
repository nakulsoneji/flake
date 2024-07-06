{pkgs, ...}: let
  scripts = [
    (pkgs.writeShellApplication {
      name = "catimg";

      runtimeInputs = with pkgs; [imagemagick];

      text = ''magick "$1" sixel:-'';
    })

    (pkgs.writeShellApplication {
      name = "check-out";

      runtimeInputs = with pkgs; [eza];

      text = ''
        depth=4

        while getopts "L:" flag; do
          case "$flag" in
            L) depth=$OPTARG ;;
            *) echo "Invalid argument provided" && exit 1 ;;
          esac
        done

        shift $((OPTIND-1))

        package=$1

        if [ -z "$package" ]; then
          echo "Enter a package as input"
          exit 1
        fi

        cd "$(nix build nixpkgs#"$package" --no-link --print-out-paths)" && eza -T -L"$depth"
      '';
    })
  ];
in {
  home.packages = scripts;
}
