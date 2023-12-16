#Prompt
prompt_symbol=㉿
interface_name="eth0"
interface=$(ip addr show dev $interface_name up | grep -o '^[0-9]*:[[:space:]][a-z0-9_]*:' |awk -F: '{print $2}' | sed s/\ //g)
ip=$(ip addr show dev $interface up | grep -o 'inet [0-9.]*' |awk '{print $2}')
PROMPT=$'%F{cyan}┌──[%B${interface}%b]-[%B${ip}%b]-[$(date "+%F---%T")]-(%B%F{blue}%n'$prompt_symbol$'%m%b%F{cyan})--[%B%F{cyan}%(6~.%-1~/…/%4~.%5~)%b%F{cyan}]\n└─%B%F{blue}%%%f%b%F{cyan} '

#^Options
setopt correct #auto correct spelling mistakes
setopt notify 
setopt interactivecomments
setopt prompt_subst #PROMPT will undergo paramter substitution
#$Options


#^History Configs
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt hist_ignore_dups  # ignore duplicated commands history list
setopt INC_APPEND_HISTORY # Save all commands to the history file immediately
setopt HIST_IGNORE_ALL_DUPS # Don't store duplicate commands
setopt share_history
#$History configs

#LS_COLORS
export LS_COLORS='fi=00;36:rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:';


#^Key binds

#VIM Mode in Terminal
export INSERT_MODE_INDICATOR="%F{cyan}+%f"
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins "^A" beginning-of-line
bindkey -M viins "^E" end-of-line
bindkey -M vicmd 'x' backward-delete-char
bindkey -M vicmd 'X' vi-delete-char
bindkey -v

bindkey '^[[Z' undo
bindkey '^U' backward-kill-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^R' history-incremental-search-backward
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
#$Key binds##

#^Styles, customzation and functionality
autoload -Uz compinit; compinit;
bindkey "^Xa" _expand_alias
zstyle ':completion:*' completer _expand_alias _complete _ignored
zstyle ':completion:*' regular true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#Enable autosuggestions
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

#Enable syntax-highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
	ZSH_HIGHLIGHT_STYLES[default]=none
	ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[path]=bold
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[command-substitution]=none
	ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[process-substitution]=none
	ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[assign]=none
	ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
	ZSH_HIGHLIGHT_STYLES[named-fd]=none
	ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
	ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
	ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi
#$Styles, customization and functionality



#^Aliases

#General
alias ls='ls --color'
alias ll='ls -lashF --color'
alias la='ls -CAshF --color'
alias l='ls -CFhas --color'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias load-functions="source ~/kali-build/roles/configurations/files/functions.sh"


#Timer
alias timer='startTimer'

#TMUX
alias bg-panes="~/ominousSHELL/scripts/tmux/bg-panes.sh"
alias ctf-panes="~/ominousSHELL/scripts/tmux/ctf-panes.sh"
alias remove-panes="~/ominousSHELL/scripts/tmux/remove-panes.sh"
#SEARCHSPLOIT
alias sss="searchsploit"
alias ssx="searchsploit -x"
alias ssm="searchsploit -m"

#SSH
alias ssh-pass="~/ominousSHELL/scripts/ssh/sshWithPass.sh"
alias ssh-key="~/ominousSHELL/scripts/ssh/sshWithKey.sh"

#^FFUF
alias ffufH="ffuf -u http://example.com -w /opt/wordlist.txt 'Host: FUZZ.example.com'"
#$FUFF

#^NMAP
alias nmapALL-tcp="~/ominousSHELL/scripts/nmap/nmapALL-tcp.sh $1"
alias nmapALL-udp="~/ominousSHELL/scripts/nmap/nmapALL-udp.sh $1"
alias nmapVERSIONS-tcp="~/ominousSHELL/scripts/nmap/nmapVERSIONS-tcp.sh $1"
alias nmapVERSIONS-udp="~/ominousSHELL/scripts/nmap/nmapVERSIONS-udp.sh $1"
#$NMAP

#COMMIX

#^SQLMAP
alias sqlmapT='sqlmap -r $1 --batch --threads=3 --level=5 --risk=3 --alert='echo -e "\e[1;32mSQL INJECTION FOUND!!!!!....\e[0m"' --flush-session --dbms MYSQL --tamper=charencode.py'
alias sqlmapR="sqlmap $1 --batch --curent-user --roles --threads=3 --level=5 --risk=3 --dbms MYSQL"
alias sqlmapP="sqlmap $1 --batch --file-dest=/tmp/userkit.sh --file-write=userkit.sh os-cmd='bash userkit.sh' --threads=3 --level=5 --risk=3 --dbms MYSQL"
alias sqlmapE="sqlmap $1 --batch --file-read=/opt/flag.txt --os-shell threads=3 --level=5 --risk=3 --dbms MYSQL"
alias sqlmapD="sqlmap $1 --batch --dbs --count --passwords --dump --threads=10 --level=5 --risk=3 --dbms MYSQL"
#$SQLMAP


#NETCAT PORTS
PORT=({1024..9100})
for i in $PORT; do
	alias $i="ncat -lnp $i"
done


#^ominousSHELL
alias ominousshell-up="~/ominousSHELL/scripts/docker/ominousshell-up.sh"
alias ominousshell-down="~/ominousSHELL/scripts/docker/ominousshell-down.sh"
alias ominousshell-backup-project="~/ominousSHELL/scripts/docker/ominousshell-backup-project.sh"
alias ominousshell-restore-project="~/ominousSHELL/scripts/docker/ominousshell-restore-project.sh"
alias ominousshell-backup="~/ominousSHELL/scripts/ominousshell-backup.sh"
alias ominous-gen="~/ominousSHELL/ominous-gen/main.py"
alias kali-backup="sudo -E ansible-playbook /home/ominousshell/kali-build/backup.yml"
alias log-out="qdbus org.kde.ksmserver /KSMServer logout 1 0 2"
alias sudo="sudo -E "

#$ominousSHELL

#$Aliases
if [ -z "$TMUX" ]; then
    tmux
fi

