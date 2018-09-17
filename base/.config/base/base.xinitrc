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

elif [[ "$HOST" == a2w ]]; then
    xrandr --dpi 192
    export GDK_SCALE=2
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_DEVICE_PIXEL_RATIO=2
    export _JAVA_OPTIONS="$_JAVA_OPTIONS -Dsun.java2d.uiScale=2"

    xinput set-prop 'DLL07BF:01 06CB:7A13 Touchpad' 'libinput Tapping Enabled' 1
    xinput set-prop 'DLL07BF:01 06CB:7A13 Touchpad' 'libinput Tapping Button Mapping Enabled' 0 1
    xinput set-prop "ELAN Touchscreen" "Device Enabled" 0
    setxkbmap -layout fr -option caps:escape

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
