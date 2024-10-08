#MISC
alias ls='ls --color'
alias ll='ls -lashF --color'
alias la='ls -CAshF --color'
alias l='ls -CFhas --color'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias timer='startTimer'
alias log-out="qdbus org.kde.ksmserver /KSMServer logout 1 0 2"
alias sudo="sudo -E "
alias add-host="~/ominousSHELL/scripts/misc/add-host.sh"
alias remove-host="sudo sed -i '\$d' /etc/hosts"
alias ominous-kit-init="~/ominousSHELL/ominous-kit/ominous-kit-init.sh"


#OPENING PORTS
LISTENING_PORTS=({0..9999})
for PORT in $LISTENING_PORTS; do
	alias $PORT="nc -lnp $PORT "
done

#STARTING SERVERS
#HTTP 
SERVER_PORTS=({0..9999})
for PORT in $SERVER_PORTS; do
	alias w-server-$PORT="python -m http.server $PORT"
done

