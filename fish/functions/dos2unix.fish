function dos2unix
    sed 's/\r$//' -i $argv
end
