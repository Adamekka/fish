# Update function
function fish_update
    set current_path (pwd)
    cd $__fish_config_dir
    git pull
    cd $current_path
end
