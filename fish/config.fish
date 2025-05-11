## Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MANROFFOPT "-c"

function prepend
    if test -d $argv[1]
        if not contains -- $argv[1] $PATH
            set -p PATH $argv[1]
        end
    end
end

prepend ~/.local/bin
prepend ~/.cargo/bin

prepend /usr/local/texlive/2024/bin/x86_64-linux
set -p INFOPATH /usr/local/texlive/2024/texmf-dist/doc/info
set -p MANPATH /usr/share/man/
set -p MANPATH /usr/local/texlive/2024/texmf-dist/doc/man

## Starship prompt
source (/usr/bin/starship init fish --print-full-init | psub)


## Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end


## Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp -r $filename $filename.bak
end

# Developing
function lspskel --argument lsp
    if test -f ~/.config/lsp_skel/$lsp
        command cp ~/.config/lsp_skel/$lsp ./.$lsp
    end
end


## Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end


## Useful aliases
# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first' # preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.="exa -a | grep -E '^\.'"

# Replace some more things with better alternatives
[ ! -x /usr/bin/bat ] && [ -x /usr/bin/cat ] && alias cat='bat'


# Latex 
alias latexclean='find . -maxdepth 1 -type f ! -name "*.tex" ! -name "*.bib" -exec rm {} \;'

alias noscreensaver='xset s off -dpms'

# Common use
alias aup="pamac upgrade --aur"
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='sudo reflector --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist && sudo pacman -Syu && fish_update_completions && sudo updatedb'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages
alias cat="bat"

# Get fastest mirrors 
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist" 
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist" 
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist" 
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist" 

alias please='sudo'

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Replace yay with paru
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

set --universal nvm_default_version lts

function fish_mode_prompt
  echo
  echo " [ "

  switch $fish_bind_mode
    case default
      set_color --bold  blue
      echo 'NORMAL'
    case insert
      set_color --bold green
      echo 'INSERT'
    case replace_one
      set_color --bold white
      echo 'REPLACE'
    case visual
      set_color --bold brmagenta
      echo 'VISUAL'
    case '*'
      set_color --bold red
      echo 'WTF'
  end
  set_color normal

  echo ' ]'
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /home/rubisrage/.anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

