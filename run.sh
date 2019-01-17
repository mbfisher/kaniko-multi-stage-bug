#!/usr/bin/env bash

set -euxo pipefail

docker run --rm -it --volume $PWD:/build gcr.io/kaniko-project/executor:debug \
  --context=/build \
  --destination=my-kaniko-bug