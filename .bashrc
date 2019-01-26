# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=500
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# All code after here added by Cibin
alias cleawr='clear'
alias del='trash-put'
alias iv='vi'
alias sl='ls'
alias octave='octave --no-gui'
alias gsync='timesync && grive -P -p ~/Google_Drive/'
alias virgo='ssh ae14d214@virgo.iitm.ac.in'
alias pycharm='pycharm-community'
alias au='sudo apt update && sudo apt-get -y upgrade'
alias gripu='grip --user cibinjoseph'
alias rm='/bin/safe-rm'
alias matlab_nogui='matlab -nodesktop -nosplash -nojvm'
alias tec='tec360 -mesa'
alias python='python3'

function cd {
  builtin cd "$@" && ls -F
}

LS_COLORS='*.f90=00;36:*.f=00;36'

# For bash autocompletion
shopt -s cdspell
shopt -s nocaseglob

# Alias for bash correction program thefuck
eval $(thefuck --alias jk)

# For make completion
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

timesync() {
  sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"
}

# Visit path
export PATH="/usr/local/visit/bin:$PATH"

# Environment variables and path for ifort
source /opt/intel/compilers_and_libraries_2017/linux/bin/compilervars.sh intel64
#source /opt/intel/parallel_studio_xe_2019/bin/psxevars.sh intel64
alias ifort19='/opt/intel/parallel_studio_xe_2019/compilers_and_libraries_2019/linux/bin/intel64/ifort'
export OMP_NUM_THREADS=40

# Environment variables and path for Intel VTune Amp
source  /opt/intel/vtune_amplifier_2019/amplxe-vars.sh quiet

# Environment variables and path for Intel Advisor
source /opt/intel/advisor_2019/advixe-vars.sh quiet

# Visible Quick bash completion using Ctrl+F
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

# path for VisIt module in python
export PYTHONPATH=/usr/local/visit/current/linux-x86_64/lib/site-packages

# path to basic heli programs
export PATH="~/Google_Drive/Programs_Copy/Heli/BasicPrograms:$PATH"

# bash git prompt
export GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh

# Tecplot path
export TEC_RS_2009=/opt/Tecplot
export TECRSHOME=/opt/Tecplot
export PATH="/opt/Tecplot/bin:$PATH"

# For FORTRAN handling programs with large arrays
ulimit -s unlimited

# ParaView path
export PATH="/opt/ParaView/bin:$PATH"

# Switch off legacy software flow control for using Ctrl-S in vim
stty -ixon

# Disable bracketed paste mode to prevent 0~ and ~1 while pasting
printf "\e[?2004l"

function untar {
  tar -xvf "$@"
}

# Disable bash autocompletion for certain unnecesary files
complete -f -X '*.@(mod|obj|aux|out|pdf|png|jpg|jpeg|gif|eps|dvi|pdf|ps|svg|nc)' -o plusdirs vim
complete -f -X '*.@(mod|obj|aux|out|pdf|png|jpg|jpeg|gif|eps|dvi|pdf|ps|svg|nc)' -o plusdirs vi

# Key bindings, up/down arrow searches through history
#"\e[A": history-search-backward
#"\e[B": history-search-forward
#"\eOA": history-search-backward
#"\eOB": history-search-forward

alias findNreplace="bash ~/WorkInProgress/findNreplace/findNreplace.sh"

# JAVA home path
export PATH="/usr/lib/jvm/default-java/bin:$PATH"

# Andrid Studio path
export PATH="/opt/android-studio/bin:$PATH"

# AVL path
export PATH="/opt/Avl:$PATH"
