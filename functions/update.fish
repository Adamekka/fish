function update
    # Debian/Ubuntu
    if type -q nala
        sudo nala update
        sudo nala upgrade
    else if type -q apt
        sudo apt update
        sudo apt upgrade
    end

    # Arch
    if type -q yay
        sudo yay -Syu
    else if type -q pacman
        sudo pacman -Syu
    end

    # Fedora
    if type -q dnf
        sudo dnf update
    end

    # macOS
    if type -q brew
        brew update
        brew upgrade
    end

    # Windows
    if type -q scoop
        scoop update
        scoop upgrade
    end

    # Nix
    if type -q nix
        nix-channel --update
        nix-env -u
    end

    # Rust
    if type -q rustup
        rustup update
    end

    # Rust programs
    if type -q cargo
        if type -q cargo-update
            cargo install-update -a
        else
            echo "Cargo is installed, but cargo-update is not."
            echo "Run 'cargo install cargo-update' to install it."
            echo "Unable to update Rust programs."
        end
    end

    # Flatpak
    if type -q flatpak
        flatpak update
    end

    # Snap
    if type -q snap
        sudo snap refresh
    end

    # Fish
    if type -q fisher
        fisher update
    end
end
