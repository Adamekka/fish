function print_package_manager --argument-names pm
    set_color blue
    set_color --bold
    echo "--- $pm ---"
    set_color normal
end

function update
    # NixOS
    if test -f /etc/NIXOS
        print_package_manager NixOS
        if type -q nh
            nh os switch --update --impure
            git status -s
        else
            sudo nix-channel --update
            sudo nixos-rebuild switch
        end
    else if type -q nix
        print_package_manager Nix
        nix-channel --update
        nix-env -u
    end

    # Arch
    if type -q yay
        print_package_manager Arch
        sudo yay -Syu
    else if type -q pacman
        print_package_manager Arch
        sudo pacman -Syu
    end

    # Debian
    if test (uname) != Darwin
        if type -q nala
            print_package_manager Debian
            sudo nala update
            sudo nala upgrade
        else if type -q apt
            print_package_manager Debian
            sudo apt update
            sudo apt upgrade
        end
    end

    # Fedora
    if type -q dnf
        print_package_manager Fedora
        sudo dnf update
    end

    # Flatpak
    if type -q flatpak
        print_package_manager Flatpak
        sudo flatpak update -y
        sudo flatpak remove --unused -y
    end

    # macOS
    if type -q brew
        print_package_manager Homebrew
        brew update
        brew outdated --greedy

        read -P "Do you want to upgrade all brew packages? [Y/n] " reply

        switch (string lower $reply)
            case "" y yes
                brew upgrade --greedy
        end
    end

    # Rust
    if type -q rustup
        print_package_manager Rust
        rustup update
    end

    # Rust programs
    if type -q cargo
        if type -q cargo-install-update
            print_package_manager "Rust programs"
            cargo install-update -a
        else
            echo "Cargo is installed, but cargo-update is not."
            echo "Run 'cargo install cargo-update' to install it."
            echo "Unable to update Rust programs."
        end
    end

    # Snap
    if type -q snap
        print_package_manager Snap
        sudo snap refresh
    end

    # Windows
    if type -q scoop
        print_package_manager Scoop
        scoop update
        scoop upgrade
    end

    # Fish config
    if grep -q "url = https://github.com/Adamekka/fish.git" $fish_config/.git/config
        print_package_manager "Fish config"
        fish_update
    end

    # Fisher
    if type -q fisher
        print_package_manager Fisher
        fisher update
        cd $fish_config
        git status -s
        cd -
    end
end
