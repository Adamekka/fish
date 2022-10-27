if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pnpm
set -gx PNPM_HOME "/home/adamekka/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Editor
set -x EDITOR nvim
set -x GIT_EDITOR $EDITOR

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0

# Import aliases
for i in (ls ~/.config/fish/aliases/)
    source ~/.config/fish/aliases/$i
end

# Import Autojump
if test -e ~/.config/fish/functions/autojump.fish
    source ~/.config/fish/functions/autojump.fish
end

# Import previous_command
# Needed for !! and !$
if test -e ~/.config/fish/functions/previous_command.fish
    source ~/.config/fish/functions/previous_command.fish
end
