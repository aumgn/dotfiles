export PATH=$HOME/.local/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

[[ -z $DISPLAY ]] \
	&& [[ $XDG_VTNR -eq 1 ]] \
	&& [[ -f ~/.xinitrc ]] \
	&& exec startx
true
