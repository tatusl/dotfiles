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
