if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pnpm
set -gx PNPM_HOME "/home/adamekka/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Editor
if test -e /usr/bin/nvim
    set -x EDITOR nvim
else if test -e /usr/bin/vim
    set -x EDITOR vim
else if test -e /usr/bin/vi
    set -x EDITOR vi
end

set -x GIT_EDITOR $EDITOR

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0

# Import aliases
for i in (ls $__fish_config_dir/aliases/)
    source $__fish_config_dir/aliases/$i
end

# Import Autojump
if test -e $__fish_config_dir/functions/autojump.fish
    source $__fish_config_dir/functions/autojump.fish
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
