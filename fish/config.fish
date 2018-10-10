#set -x FZF_DEFAULT_COMMAND 'find . -type f'
set -x FZF_DEFAULT_COMMAND "ag -g '.*'"

source ~/.config/fish/proxy.settings

# Editor
set -x EDITOR nvim
set -x VISUAL nvim

# disable greeting
set fish_greeting

function fish_user_key_bindings
    fzf_key_bindings
end
