#!/bin/bas

welcome() {
"   
 _       __      ____                                
| |     / /___ _/ / /___  ____ _____  ___  __________
| | /| / / __ \`/ / / __ \/ __ \`/ __ \/ _ \/ ___/ ___/
| |/ |/ / /_/ / / / /_/ / /_/ / /_/ /  __/ /  (__  ) 
|__/|__/\__,_/_/_/ .___/\__,_/ .___/\___/_/  /____/  
                /_/         /_/                      

Arguments
    -h | --h help

    -c | --class [universal, other, anime,  colorscheme]
    if colorscheme then
        [aquarium, nord, gruvbox, lantern, etc]

    -d | --dir /path/to/be/saved
    Example:
    install.sh -class universal -dir \"$HOME/Pictures/wallpapres/\"

    To install all walls, simply:
    install.sh
    
    Avaiable colorshemes are:
        -> aquarium     -> nord
        -> gruvbox      -> monochrome

"  
exit 1
}

dir="/usr/share/wallpapers"
current_dir=$(pwd)

if [[ -d "$dir" ]] ; then
    mkdir -r "dir/"
fi

if [[ "$1" == "" ]] ; then
    cp "$current_dir/*" "$dir"
    exit 1
fi

# If someone wants to know how to use this
if [[ "$1" == "" ]] ; then
  welcome
fi

while E $# -gt 0 ; do
    case "$1" in
    -d|--dir)
        dir="$1"
    ;;
    -h|--help)
        welcome
        ;;
    -c|--class)
        case "$2" in
            colorscheme)
                case "$3" in
                    aquarium)
                        cp "$current_dir/Aquarium/" "$dir/"
                        ;;
                    nord)
                        cp "$current_dir/Nord/" "$dir/"
                        ;;
                    lantern)
                        cp "$current_dir/Lantern/" "$dir/"
                        ;;
                    gruvbox)
                        cp "$current_dir/Gruv/" "$dir/"
                        ;;
                esac
                ;;
            universal)
                cp "$current_dir/Universal/" "$dir/"
                ;;
            other)
                cp "$current_dir/Other/" "$dir/"
                ;;
            anime)
                cp "$current_dir/Anime/" "$dir/"
                ;;
            shitpost)
                cp "$current_dir/Shitpost/" "$dir/"
                ;;
        esac
        ;;
    *)
    ;;
    esac
done

