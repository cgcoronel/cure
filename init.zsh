#!/bin/zsh

VERSION="0.0.4"

target_dir="$CURE_HOME/modules"
func="${CURE_HOME}/functions"

if [[ ! -d "$target_dir" ]]; then
    echo "installing Cure in '$CURE_HOME'..."
    mkdir -p "$target_dir"
    source "$func/modules-init"
fi

typeset -A plugins

while IFS=' ' read -A line; do
    if [[ $#line -eq 2 && $line[1] != "#" ]]; then
        plugins[$line[1]]=$line[2]
    fi
done < <(grep -E -v "^\s*#|^\s*$" "$CURE_HOME/.modules")


fpath=($target_dir/zimfw/utility/functions $target_dir/zimfw/git-info/functions $target_dir/zsh-user/zsh-completions/src ${fpath})
autoload -Uz -- mkcd mkpw coalesce git-action git-info

for repo init_file in ${(kv)plugins}; do
    if [[ ! -d "$target_dir/$repo" ]]; then
        echo "installing module: '$repo'"
       git clone "https://github.com/$repo" "$target_dir/$repo" > /dev/null 2>&1 
    fi

    if [[ -n $init_file && -f "$target_dir/$repo/$init_file" ]]; then
       source "$target_dir/$repo/$init_file"
    fi
done

function cure() {
    case "$1" in
         "version")
            echo "Cure version: $VERSION" 
            ;;
        "update")
            source "$func/modules-update" 
            ;;
        "upgrade")
            if [[ -d "$CURE_HOME" ]]; then
                git -C "$CURE_HOME" pull --quiet --ff --rebase --autostash
                echo "Cure self-update complete."

                source ${CURE_HOME}/init.zsh

                cure version
            else
                echo "CURE_HOME directory not found: $CURE_HOME"
            fi
            ;;
        *)
            echo "Usage: cure [update|upgrade|version]"
            ;;
    esac
}


