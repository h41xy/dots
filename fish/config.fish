#set -x FZF_DEFAULT_COMMAND 'find . -type f'
#set -x FZF_DEFAULT_COMMAND "ag -g '.*'"
set -x FZF_DEFAULT_COMMAND "ag -U --ignore 'nvim/undodir' --hidden -g '.*'"
set -g FZF_CTRL_T_COMMAND "command ag --ignore 'nvim/undodir' -f -g '.*' \$dir 2> /dev/null"

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

# Set man page colors
set -x LESS_TERMCAP_mb (printf "\033[01;31m")  
set -x LESS_TERMCAP_md (printf "\033[01;31m")  
set -x LESS_TERMCAP_me (printf "\033[0m")  
set -x LESS_TERMCAP_se (printf "\033[0m")  
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")  
set -x LESS_TERMCAP_ue (printf "\033[0m")  
set -x LESS_TERMCAP_us (printf "\033[01;32m")  
