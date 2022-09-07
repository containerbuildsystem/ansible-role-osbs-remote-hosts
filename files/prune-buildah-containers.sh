#!/bin/bash
set -o errexit -o nounset -o pipefail

usage() {
    cat << EOF
usage: $0 before [remote_connection]

Prune external containers (e.g. buildah containers) older than the specified
date. Such containers do not get pruned by podman's default pruning mechanisms.

args:
    before: date --date=\$before (a timestamp, an ISO date, '1 day ago', ...)
    remote_connection: podman-remote connection name (default local machine)
EOF
}

before=${1:-''}
remote_connection=${2:-''}

if [[ -z "$before" ]]; then
    usage >&2
    exit 1
fi

if [[ -n "$remote_connection" ]]; then
    podman=(podman --remote --connection "$remote_connection")
else
    podman=(podman)
fi

before_ts=$(date +%s --date="$before")
containers_to_remove=$(
    "${podman[@]}" container ls -a --external --format json |
    jq -c --argjson before_ts "$before_ts" \
        '.[] | select(.Created < $before_ts and .Status == "Storage") | {Id, Names}'
)

if [[ -z "$containers_to_remove" ]]; then
    echo "Nothing to remove."
else
    echo "Containers to remove:"
    jq -r '"Id=\(.Id) Name=\(.Names[0])"' <<< "$containers_to_remove"
    jq -r '.Id' <<< "$containers_to_remove" | xargs -n 10 "${podman[@]}" container rm -f
fi
