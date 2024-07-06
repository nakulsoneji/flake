{pkgs, ...}: let
  scripts = [
    (pkgs.writeShellApplication {
      name = "wayland-screenshot";

      runtimeInputs = with pkgs; [swappy dunst];

      text =
        /*
        bash
        */
        ''
          screenshot_actions () {
            tmpfile=$1
            wl-copy < "$tmpfile"
            action="$(dunstify --icon="$tmpfile" "Screenshot copied" -A "default,Edit" -A "save,Save")"

            if [[ "$action" != "1" ]] && [[ "$action" != "2" ]]; then
              imgfile="$XDG_SCREENSHOTS_DIR/screenshot-$(date +"%s.png")"

              case "$action" in
                default)
                  cp "$tmpfile" "$imgfile"
                  swappy -f "$imgfile" -o "$imgfile"
                  rm "$imgfile"
                  ;;
                save)
                  cp "$tmpfile" "$imgfile"
                  ;;
              esac
            fi

            rm "$tmpfile"
          }

          if [[ "$1" == "r" ]]; then
            tmpfile="$(mktemp /tmp/grim-img-XXXXXX)"

            if grim -g "$(slurp)" "$tmpfile"; then
              screenshot_actions "$tmpfile"
            else
              rm "$tmpfile"
              exit 1
            fi

          elif [[ "$1" == "f" ]]; then
            tmpfile="$(mktemp /tmp/grim-img-XXXXXX)"

            if grim "$tmpfile"; then
              screenshot_actions "$tmpfile"
            else
              rm "$tmpfile"
              exit 1
            fi

            rm "$tmpfile"

          fi
        '';
    })

    (pkgs.writeShellApplication {
      name = "wayland-record";

      runtimeInputs = with pkgs; [wf-recorder slurp dunst];

      text =
        /*
        bash
        */
        ''
          recfile="$XDG_RECORDINGS_DIR/recording_$(date +"%s.mp4")"

          record_dim () {
            dim="$(slurp)" || exit 1
            wf-recorder -g "$dim" -f "$recfile"
            exit 1
          }

          record_fullscreen() {
            wf-recorder -f "$recfile"
          }

          toggle_record_dim () {
            if pkill -x wf-recorder; then
              dunstify --icon "/dev/null" "Recording saved"
            else
              record_dim
            fi
          }

          toggle_record_fullscreen () {
            if pkill -x wf-recorder; then
              dunstify --icon "/dev/null" "Recording saved"
            else
              record_fullscreen
            fi
          }

          if [[ $1 == r ]]; then
            toggle_record_dim
          elif [[ $1 == f ]]; then
            toggle_record_fullscreen
          fi

        '';
    })
  ];
in {
  home.packages = scripts;
}
