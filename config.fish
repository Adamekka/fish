# This checking is needed or Termux will go crazy
if type -q lsb_release
    set -x DISTRO (lsb_release -si)
else
    set -x DISTRO unknown
end

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0

# Source env vars
for i in $__fish_config_dir/env_vars/*.fish
    source $i
end

# Source aliases
for i in $__fish_config_dir/aliases/*.fish
    source $i
end

# Source abbreviations
for i in $__fish_config_dir/abbrs/*.fish
    source $i
end

# Source previous_command
# Needed for !! and !$
if test -e $__fish_config_dir/functions/previous_command.fish
    source $__fish_config_dir/functions/previous_command.fish
end

# Source fish_update
if test -e $__fish_config_dir/functions/fish_update.fish
    source $__fish_config_dir/functions/fish_update.fish
end

# Set theme
fish_config theme choose "Dracula Official"

starship init fish | source
