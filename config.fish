# Set distro global variable
set -x DISTRO (lsb_release -si)

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Editor
if type -q nvim
    set -x EDITOR nvim
else if type -q vim
    set -x EDITOR vim
else if type -q vi
    set -x EDITOR vi
end

set -x GIT_EDITOR $EDITOR

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0

# Import aliases
for i in (ls $__fish_config_dir/aliases/)
    source $__fish_config_dir/aliases/$i
end

# Import previous_command
# Needed for !! and !$
if test -e $__fish_config_dir/functions/previous_command.fish
    source $__fish_config_dir/functions/previous_command.fish
end

# Import Updating
if test -e $__fish_config_dir/functions/fish_update.fish
    source $__fish_config_dir/functions/fish_update.fish
end

# Import private stuff (scripts for this machine only in ./functions/private.fish)
if test -e $__fish_config_dir/functions/private.fish
    source $__fish_config_dir/functions/private.fish
end

starship init fish | source
