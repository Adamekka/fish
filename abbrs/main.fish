# Doas
if type -q doas
    abbr -a s doas
    abbr -a sudo doas
else
    abbr -a s sudo
end

# Killall
abbr -a ka killall

# swift-format
abbr -a sf "swift-format -i **/*.swift"
