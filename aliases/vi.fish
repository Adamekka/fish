# This file checks what Vi-like editor do you use and then sets aliases accordingly
if test -e /usr/bin/nvim
    alias v="nvim"
    alias vi="nvim"
    alias vim="nvim"
else if test -e /usr/bin/vim
    alias v="vim"
    alias vi="vim"
    alias nvim="vim"
else if test -e /usr/bin/vi
    alias v="vi"
    alias vim="vi"
    alias nvim="vi"
end
