# FZF configuration
if type -q fzf
   set -g FZF_DEFAULT_COMMAND 'find . -type f'
   set -g FZF_CTRL_T_COMMAND 'find . -type f'
   set -g FZF_ALT_C_COMMAND 'find . -type d'
   if type -q ag
        set -g FZF_DEFAULT_COMMAND "ag -U --ignore 'nvim/undodir' --ignore-dir '.m2' --hidden -g '.*'"
        set -g FZF_CTRL_T_COMMAND "command ag --hidden --ignore 'nvim/undodir' -f -g '.*' \$dir 2> /dev/null"
   end
   if type -q fd or type -q fdfind
        set -g FZF_DEFAULT_COMMAND "command fdfind '.*' --hidden --no-ignore --follow --exclude 'nvim/undodir' --exclude '.m2/*' --color never \$dir 2> /dev/null"
        set -g FZF_CTRL_T_COMMAND "command fdfind '.*' --hidden --no-ignore --follow --exclude 'nvim/undodir' --exclude '.m2/*' --color never \$dir 2> /dev/null"
        set -g FZF_ALT_C_COMMAND "command fdfind '.*' --hidden --no-ignore --follow --exclude 'nvim/undodir' --exclude '.m2/*' --color never --type d \$dir 2> /dev/null"
   end
end
# fzf autopreview
set -g FZF_DEFAULT_OPTS "--preview 'cat {}'"
# bat ist cat with syntax highlight
if type -q bat
    set -g FZF_DEFAULT_OPTS "--preview 'bat {}'"
end

## Set proxy if existend
if test -e ~/.config/fish/proxy.settings
    source ~/.config/fish/proxy.settings
end

# Editor
set -x EDITOR nvim
set -x VISUAL nvim

# disable greeting
set fish_greeting

function fish_user_key_bindings
    fzf_key_bindings
end

## keybindings
if type -q setxkbmap
    # set us laytout without deadkeys
    setxkbmap -layout us -variant altgr-intl -option nodeadkeys
    # disable capslock, switch it to ctrl
    setxkbmap -option ctrl:nocaps
end

# Set man page colors
set -x LESS_TERMCAP_mb (printf "\033[01;31m")  
set -x LESS_TERMCAP_md (printf "\033[01;31m")  
set -x LESS_TERMCAP_me (printf "\033[0m")  
set -x LESS_TERMCAP_se (printf "\033[0m")  
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")  
set -x LESS_TERMCAP_ue (printf "\033[0m")  
set -x LESS_TERMCAP_us (printf "\033[01;32m")  

# golang stuff
set -gx PATH /opt/go/bin $PATH
set -x -U GOPATH $HOME/dev/go

# scripts
set -gx PATH ~/bin $PATH
#set -x GOPATH $HOME/dev/go
#set -x PATH $PATH (go env GOPATH)/bin
#
#set -x PATH $PATH ~/bin

# abbreviations
abbr gs 'git status'
abbr ga 'git add'
abbr g. 'git add .'
abbr gcm 'git commit -m'
abbr gck 'git checkout'
abbr gd ' git diff'
abbr gf 'git fetch'
abbr gp 'git push'

# sudo !!
alias dang='commandline -i "sudo $history[1]";history delete --exact --case-sensitive doh'

# java does not know bspwm
#
# Java maintains a hard-coded list of window managers that it knows about. When you use a different WM it simply assumes that it is reparenting and may present you with empty grey windows if your WM is actually not reparenting.

#If you run into this problem with OpenJDK version 8u40_3 or above, you can simply set the environment variable _JAVA_AWT_WM_NONREPARENTING=1 and your GUI applications should behave as expected. In prior versions or when using the Oracle JDK you may need to trick Java into thinking that you are using a non-reparenting WM that it knows about, like LG3D. To do that you need the wmname tool from the same-named repo package:

# xbps-install -S wmname

#Simply call it like this:

#$ wmname LG3D

#Afterwards your Java GUI applications should run as intended. However, you need to re-run the program every time your WM restarts or you reboot the computer. 
#
set -x _JAVA_AWT_WM_NONREPARENTING 1
