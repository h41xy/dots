function xkcdpw
    shuf -n$argv /usr/share/dict/words | tr -d '\n\''
end

