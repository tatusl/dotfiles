# Load multiple kubeconfigs
function loadkubeconfig() {
    kubeconfig=""

    for kubecfg in "$HOME/.kube/config.d/"*; do
       kubeconfig+=$kubecfg:
    done

    export KUBECONFIG=$kubeconfig
}

# Unset kubecontext
function unloadkubeconfig() {
    unset KUBECONFIG
}

# 1Password secrets wrapper
# Searches for .env.tpl files from git root down to cwd and merges them.
# More specific (closer to cwd) values override more general ones.
credspop() {
  [[ "$1" == "--" ]] && shift
  local git_root
  git_root="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "Not in a git repository" >&2
    return 1
  }

  local -a tpl_files=()
  local dir="$PWD"
  while [[ "$dir" == "$git_root"* ]]; do
    [[ -f "$dir/.env.tpl" ]] && tpl_files=("$dir/.env.tpl" "${tpl_files[@]}")
    [[ "$dir" == "$git_root" ]] && break
    dir="${dir:h}"
  done

  if (( ${#tpl_files} == 0 )); then
    echo "No .env.tpl found between cwd and git root" >&2
    return 1
  fi

  if (( ${#tpl_files} == 1 )); then
    op run --env-file="${tpl_files[1]}" -- "$@"
    return
  fi

  local merged
  merged="$(mktemp)" || return 1
  trap "rm -f '$merged'" EXIT
  # Process most-specific first so awk keeps the first (winning) value per key
  local -a reversed=()
  local f; for f in "${tpl_files[@]}"; do reversed=("$f" "${reversed[@]}"); done
  awk -F= '!seen[$1]++ {print}' "${reversed[@]}" > "$merged"

  op run --env-file="$merged" -- "$@"
}
