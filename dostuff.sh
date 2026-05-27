#usr/bin/env bash

set -euo pipefail

echo "Checking $DOCKERFILE"

images=$(awk '/\s*FROM / { print $2 }' $DOCKERFILE)

if [[ -z $images ]]; then
    echo "No FROM directives found, exiting"
    exit 0
fi

for img in $images; do
    echo "Pulling and checking $img"
    docker pull $img
    onbuilds=$(docker inspect $img | jq -r '.[].Config.OnBuild | length')
    if (( onbuilds != 0 )); then
        echo "$img has ONBUILDs, and that's probably not a good thing"
        exit 1
    fi
done

echo "All Good! 😎"


