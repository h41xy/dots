function gla
    #git log --oneline --decorate --graph --all --author-date-order $argv;
    git log --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(cyan)(%cr) %C(magenta)<%an - %ae>%Creset' --abbrev-commit --date=relative --author-date-order --all $argv;

end
