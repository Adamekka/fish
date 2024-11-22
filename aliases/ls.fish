if type -q eza
    set ls_ eza
else if type -q exa
    set ls_ exa
else
    set -g ls_ ls
end

alias l="$ls_ -F --icons --group-directories-first"
alias ls="$ls_ -F --icons --group-directories-first"
alias la="$ls_ -aF --icons --group-directories-first"
alias ll="$ls_ -lhF --icons --git --group-directories-first"
alias lr="$ls_ -RF --icons --group-directories-first"
alias lt="$ls_ -TF --icons --group-directories-first"
