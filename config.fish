# Set distro global variable
if type -q lsb_release # This checking is needed or Termux will go crazy
    set -x DISTRO (lsb_release -si)
else
    set -x DISTRO unknown
end

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
else if type -q helix
    set -x EDITOR helix
end

set -x GIT_EDITOR $EDITOR

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0

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

# Source private stuff (scripts for this machine only in ./functions/private.fish)
if test -e $__fish_config_dir/functions/private.fish
    source $__fish_config_dir/functions/private.fish
end

# Rust wrapper
set -x RUSTC_WRAPPER sccache

# Java and Android
if test (uname) = Darwin
    set -x JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
    set -x ANDROID_HOME /opt/homebrew/share/android-sdk
    set -x ANDROID_NDK_ROOT /opt/homebrew/share/android-ndk
else
    set -x JAVA_HOME /usr/lib/jvm/jre-20-openjdk
end

# For SDKMAN
if test -e ~/.sdkman/bin/sdkman-init.sh
    bass source ~/.sdkman/bin/sdkman-init.sh
end

# Godot
if type -q godot
    alias godot4="godot"
end

# Swift beta
if test -e "/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift"
    alias swift="/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift"
end

# Set theme
fish_config theme choose "Dracula Official"

starship init fish | source

# opam configuration
source ~/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
