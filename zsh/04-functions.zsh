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
credspop() {
  [[ "$1" == "--" ]] && shift
  local env_file="$(git rev-parse --show-toplevel 2>/dev/null)/.env.tpl"
  if [[ ! -f "$env_file" ]]; then
    echo "No .env.tpl found in git root" >&2
    return 1
  fi
  op run --env-file="$env_file" -- "$@"
}
