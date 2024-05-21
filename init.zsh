#!/bin/zsh

VERSION="0.1.2"

target_dir="${CURE_HOME}/modules"
func_dir="${CURE_HOME}/functions"

if [[ ! -d "$target_dir" ]]; then
    echo "\nInstalling Cure in '$CURE_HOME'...\n"
    mkdir -p "$target_dir"
    source "${func_dir}/modules-init"
fi

typeset -A plugins
while IFS=' ' read -A line; do
    if [[ ${#line[@]} -eq 2 && $line[1] != "#" ]]; then
        plugins[${line[1]}]=${line[2]}
    fi
done < <(grep -E -v "^\s*#|^\s*$" "${CURE_HOME}/.modules")

fpath=(
    "$target_dir/zimfw/utility/functions"
    "$target_dir/zimfw/git-info/functions"
    "$target_dir/zsh-user/zsh-completions/src"
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

