killall -q mako

while pgrep -u $UID -x mako >/dev/null; do sleep 1; done

mako > /dev/null 2>&1 &
