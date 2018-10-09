set -x FZF_DEFAULT_COMMAND 'find . -type f'
set fish_greeting

function fish_user_key_bindings
    fzf_key_bindings
end
