export PATH=$HOME/.local/bin:/home/aumgn/.cargo/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export EDITOR=emacsclient -a emacs -c

[[ -z $DISPLAY ]] \
	&& [[ $XDG_VTNR -eq 1 ]] \
	&& [[ -f ~/.xinitrc ]] \
	&& exec ssh-agent startx

true
