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

        # Fish config
        fish_update

        # Fisher
        if type -q fisher
            fisher update
            pushd $fish_config
            git status -s
            popd -
        end
        return
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
        if type -q cargo-install-update
            cargo install-update -a
        else
            echo "Cargo is installed, but cargo-update is not."
            echo "Run 'cargo install cargo-update' to install it."
            echo "Unable to update Rust programs."
        end
    end

    # Flatpak
    if type -q flatpak
        sudo flatpak update -y
        sudo flatpak remove --unused -y
        sudo flatpak repair
    end

    # Snap
    if type -q snap
        sudo snap refresh
    end

    # Python packages
    if type -q pip
        pip install --upgrade pip
        pip list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 pip install -U
    else if type -q pip3
        pip3 install --upgrade pip
        pip3 list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 pip3 install -U
    end

    # Node.js packages
    if type -q npm
        npm update -g
    end

    # Yarn packages
    if type -q yarn
        yarn global upgrade
    end

    # Ruby gems
    if type -q gem
        gem update
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
