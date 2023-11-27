# Doas
if type -q doas
    abbr -a s doas
    abbr -a sudo doas
else
    abbr -a s sudo
end

# Killall
abbr -a ka killall

# swiftformat
abbr -a sf "swiftformat **/*.swift"

# autopep8
abbr -a pyfmt "autopep8 -i -r **/*.py"

# virt-manager
abbr -a vm "virt-manager -c qemu:///session --no-fork"
