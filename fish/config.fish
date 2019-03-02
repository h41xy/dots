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
        set -g FZF_DEFAULT_COMMAND "command fdfind '.*' --hidden --follow --exclude 'nvim/undodir' --exclude '.m2/*' --color never \$dir 2> /dev/null"
        set -g FZF_CTRL_T_COMMAND "command fdfind '.*' --hidden --follow --exclude 'nvim/undodir' --exclude '.m2/*' --color never \$dir 2> /dev/null"
        set -g FZF_ALT_C_COMMAND "command fdfind '.*' --hidden --follow --exclude 'nvim/undodir' --exclude '.m2/*' --color never --type d \$dir 2> /dev/null"
   end
end

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

if type -q setxkbmap
   ## keybindings
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
