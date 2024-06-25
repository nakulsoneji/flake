depth=4

while getopts "l:" flag; do 
  case "$flag" in 
    l) depth=$OPTARG ;;
    *) echo "Invalid argument provided: \"$flag\"" && exit 1 ;;
  esac
done

shift $((OPTIND-1))

package=$1

if [ -z "$package" ]; then
  echo "Enter a package as input"
  exit 1
fi

cd "$(nix build nixpkgs#"$package" --no-link --print-out-paths)" && eza -T -L"$depth"
