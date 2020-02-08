unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
bindkey -e

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/gamebox/ohmyzsh"

# Set name of the theme to load
ZSH_THEME="tuxi"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=10

# Which plugins would you like to load?
plugins=(git archlinux docker ansible vscode yarn common-aliases)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=fr_FR.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes.
alias zshconfig="xed ~/.zshrc"
alias ohmyzsh="xed ~/.ohmyzsh"
alias ifconfig="sudo ip addr"
alias swapClear="sudo swapoff -a && sudo swapon -a"
alias ping="ping -c 5"
alias dmongo="docker run -d --rm --name mongoDev -p 27017:27017 -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro -v ~/mongoData/data:/data/db mongo:4.0.5"
alias dredis="docker run -d --rm --name redisDev -p 6379:6379 redis redis-server --requirepass redisDev"

# readable output
alias df='df -h'

# pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"

# free
alias free="free -mt"

# continue download
alias wget="wget -c"

# merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# yay as aur helper - updates everything
alias pksyua="yay -Syu --noconfirm"
alias upall="yay -Syu --noconfirm"

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# copy/paste all content of /etc/skel over to home folder - backup of config created - beware
alias skel='cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~'
# backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

# copy bashrc-latest over on bashrc - cb= copy bashrc
alias cb='sudo cp /etc/skel/.bashrc ~/.bashrc && source ~/.bashrc'
# copy /etc/skel/.zshrc over on ~/.zshrc - cb= copy zshrc
alias cz='sudo cp /etc/skel/.zshrc ~/.zshrc && source ~/.zshrc'

# switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

# hardware info --short
alias hw="hwinfo --short"

# skip integrity check
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

# check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

# get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# nano for important configuration files
# know what you do in these files
alias nlightdm="sudo nano /etc/lightdm/lightdm.conf"
alias npacman="sudo nano /etc/pacman.conf"
alias ngrub="sudo nano /etc/default/grub"
alias nmkinitcpio="sudo nano /etc/mkinitcpio.conf"
alias nmirrorlist="sudo nano /etc/pacman.d/mirrorlist"
alias nconfgrub="sudo nano /boot/grub/grub.cfg"

# shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

neofetch