function fish_prompt
	test $SSH_TTY; and printf (set_color red)(whoami)(set_color white)'@'(set_color yellow)(hostname)' '

    test $USER = 'root'; and echo (set_color red)"#"

    # set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
    set -l git_branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\[\1\] /')

    # Main
	echo -n (set_color cyan)(prompt_pwd) (set_color green)"$git_branch"(set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end
