function update
    # NixOS
    if test -f /etc/NIXOS
        if type -q nh
            nh os switch --update --impure
            git status -s
        else
            sudo nix-channel --update
            sudo nixos-rebuild switch
        end
    else if type -q nix
        nix-channel --update
        nix-env -u
    end

    # Arch
    if type -q yay
        sudo yay -Syu
    else if type -q pacman
        sudo pacman -Syu
    end

    # Debian/Ubuntu
    if test (uname) != Darwin
        if type -q nala
            sudo nala update
            sudo nala upgrade
        else if type -q apt
            sudo apt update
            sudo apt upgrade
        end
    end

    # Fedora
    if type -q dnf
        sudo dnf update
    end

    # Flatpak
    if type -q flatpak
        sudo flatpak update -y
        sudo flatpak remove --unused -y
        sudo flatpak repair
    end

    # macOS
    if type -q brew
        brew update
        brew outdated --greedy

        read -P "Do you want to upgrade all brew packages? [Y/n] " reply

        switch (string lower $reply)
            case "" y yes
                brew upgrade --greedy
        end
    end

    # Nix
    if type -q nix
    end

    # Rust
    if type -q rustup
        rustup update
    end

    # Rust programs
    if type -q cargo
        if type -q cargo-install-update
            cargo install-update -a
        else
            echo "Cargo is installed, but cargo-update is not."
            echo "Run 'cargo install cargo-update' to install it."
            echo "Unable to update Rust programs."
        end
    end

    # Snap
    if type -q snap
        sudo snap refresh
    end

    # Windows
    if type -q scoop
        scoop update
        scoop upgrade
    end

    # Fish config
    if grep -q "url = https://github.com/Adamekka/fish.git" $fish_config/.git/config
        fish_update
    end

    # Fisher
    if type -q fisher
        fisher update
        cd $fish_config
        git status -s
        cd -
    end
end
