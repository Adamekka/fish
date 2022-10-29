# Update function
function fish_update
    set current_path (pwd)
    cd ~/.config/fish
    git pull
    cd $current_path
end
