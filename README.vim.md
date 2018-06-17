# Vim Cmds

Vim is a language.
## Operators
c - change
cc - change whole line
d - delete
dd - delete whole line
## Basic motions
hjkl - left,down,up,right
0 (zero) - first character in line
^ - first non blank character in line
$ - end of line
[line-number]G - go to line number (activate line numbers with :set number)
## Word motions
w - go to the start of the next word
e - go to the end of the next word
## Text object motions
( - go to start of the current sentence
) - go to end of the current sentence
{ - go to start of the current paragraph
} - go to end of the current paragraph

## Examples
Motions are for cursor movement but also for operations.
Operators can be combined with motions.
For example to delete a word in a sentence, go to the beginning of the word and press dw in normal mode.
Everything "below the motion of the cursor" will be deleted.

Every operator or motion is combinable with a count.
To delete 3 Words, type 3dw.
To move 3 line down type 3j.
