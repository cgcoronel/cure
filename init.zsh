#!/bin/zsh
# termina zsh plugin manager

target_dir="$CURE_HOME/modules"

typeset -A plugins
plugins=(
  "zimfw/environment" "init.zsh"
  "zimfw/asciiship" "asciiship.zsh-theme"
  "zimfw/completion" "init.zsh"
  "zimfw/git-info" "init.zsh"
  "zimfw/input" "init.zsh"
  "zimfw/utility" "init.zsh"
  "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh"
  "zsh-users/zsh-completions" "zsh-completions.zsh"
  "zsh-users/zsh-history-substring-search" "zsh-history-substring-search.zsh"
  "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"
)

if [[ ! -d "$target_dir" ]]; then
    echo
    echo "installing Cure in '$CURE_HOME'..."
    echo
    mkdir -p "$target_dir"
fi

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

function git-pull-all-modules() {
    if [[ -d "$target_dir" ]]; then
        for repo init_file in ${(kv)plugins}; do
            if [[ -d "$target_dir/$repo" ]]; then
                echo "Updating $repo..."
                (cd "$target_dir/$repo" && git pull)
            fi
        done
    else
        echo "Cure directory not found: $target_dir"
    fi
}

function cure() {
    if [[ $# -eq 1 ]]; then
        if [[ $1 == "update" ]]; then
            git-pull-all-modules
        elif [[ $1 == "upgrade" ]]; then
            if [[ -d "$CURE_HOME" ]]; then
                git -C "$CURE_HOME" pull
            else
                echo "CURE_HOME directory not found: $CURE_HOME"
            fi
        else
            echo "Usage: cure [update|upgrade]"
        fi
    else
        echo "Usage: cure [update|upgrade]"
    fi
}

