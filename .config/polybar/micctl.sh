#!/usr/bin/env bash

##################################################################
# Polybar Pulseaudio Control                                     #
# https://github.com/marioortizmanero/polybar-pulseaudio-control #
##################################################################

# Defaults for configurable values, expected to be set by command-line arguments
AUTOSYNC="no"
COLOR_MUTED="%{F#6b6b6b}"
ICON_MUTED=" "
ICON_SINK=
ICONS_VOLUME=(" " " ")
NOTIFICATIONS="NO"
OSD="no"
SINK_NICKNAMES_PROP=
VOLUME_STEP=2
VOLUME_MAX=130
# shellcheck disable=SC2016
FORMAT='$VOL_ICON ${VOL_LEVEL}% $ICON_SINK $SINK_NICKNAME'
declare -A SINK_NICKNAMES
declare -a ICONS_VOLUME
declare -a SINK_BLACKLIST

# Environment & global constants for the script
export LANG=en_US  # Some calls depend on English outputs of pactl
END_COLOR="%{F-}"  # For Polybar colors

# Saves the status of the sink passed by parameter into a variable named
# `isMuted`.
function getIsMuted() {
    isMuted=$(pactl list source | grep -E "^Sink #$1\$" -A 15 | awk '/Mute: / {print $2}')
}
function micMute() {
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
}

function listen() {
    local firstRun=0

    # Listen for changes and immediately create new output for the bar.
    # This is faster than having the script on an interval.
    pactl subscribe 2>/dev/null | {
        while true; do
            {
                # If this is the first time just continue and print the current
                # state. Otherwise wait for events. This is to prevent the
                # module being empty until an event occurs.
                if [ $firstRun -eq 0 ]; then
                    firstRun=1
                else
                    read -r event || break
                    # Avoid double events
                    if ! echo "$event" | grep -e "on card" -e "on sink" -e "on server"; then
                        continue
                    fi
                fi
            } &>/dev/null
            output
        done
    }
}

function output() {
}

case "$1" in
    togmute)
        micMute toggle
        ;;
    listen)
        listen
        ;;
    output)
        output
        ;;
    *)
        echo "Unrecognised action: $1" >&2
        exit 1
        ;;
esac

