# Vi stuff
alias v="$EDITOR"
alias vi="$EDITOR"
alias vim="$EDITOR"
alias nvim="$EDITOR"

# Termux throws errors when empty aliases are present
# This if statement fixes that
if type -q sudoedit
    alias sv="sudoedit"
    alias svi="sudoedit"
    alias svim="sudoedit"
    alias snvim="sudoedit"
end
