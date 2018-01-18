source ~/.config/base/environment

numlockx on &
for xresources in ~/.config/*/Xresources; do
    xrdb -I$HOME/.config -merge $xresources
done

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

if [[ "$USER" == nan ]]; then
    export GTK_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
    export QT_IM_MODULE=ibus

    ibus-daemon -rd
fi

if [[ "$HOST" == a2d ]]; then
    xrandr --output $LEFT_MONITOR --primary
    xrandr --output $LEFT_MONITOR --left-of $RIGHT_MONITOR

    setxkbmap -layout gb -variant extd -option caps:escape
    pulseaudio --start
elif [[ "$HOST" == a2l ]]; then
    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

    setxkbmap -layout fr -option caps:escape
    pulseaudio --start
elif [[ "$HOST" == a2e ]]; then
    xrandr --output $LEFT_MONITOR --primary
    xrandr --output $LEFT_MONITOR --left-of $RIGHT_MONITOR

    setxkbmap -layout fr -option caps:escape
fi

for xinitrc in ~/.config/*/xinitrc; do
   . $xinitrc
done
