#!/bin/zsh

VERSION="1.1.0"

target_dir="${CURE_HOME}/modules"
func_dir="${CURE_HOME}/functions"

if [[ ! -d "$target_dir" ]]; then
    echo "\nInstalling Cure in '$CURE_HOME'...\n"
    mkdir -p "$target_dir"
    source "${func_dir}/modules-init"
fi

typeset -A plugins
while read -r line; do
    if [[ -n "$line" && "$line" != \#* ]]; then
        set -- ${(s: :)line}
        if [[ $# -eq 2 ]]; then
            plugins[$1]=$2
        fi
    fi
done < "${CURE_HOME}/.modules"

fpath=(
     "$target_dir/zimfw/git-info/functions"
     ${fpath}
)

autoload -Uz -- mkcd mkpw coalesce git-action git-info

for repo init_file in ${(kv)plugins}; do
    repo_dir="${target_dir}/${repo}"

    if [[ ! -d "$repo_dir" ]]; then
        echo "Installing module: '$repo'"
        git clone "https://github.com/${repo}" "${repo_dir}" > /dev/null 2>&1
    fi

    if [[ -n "$init_file" && -f "${repo_dir}/${init_file}" ]]; then
        source "${repo_dir}/${init_file}"
    fi
done

source "${func_dir}/cure-help"

