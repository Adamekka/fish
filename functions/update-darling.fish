function update-darling
    if type -q darling
        cd ~/Coding/darling || exit
        git lfs install
        git pull
        git submodule update --init --recursive
        cd build || exit
        cmake ..
        make
        sudo make install
    else
        echo "Darling not installed"
    end
end
