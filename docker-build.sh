#!/usr/bin/env bash

set -euxo pipefail

docker build --no-cache -t my-multi-stage-build .
docker run --rm my-multi-stage-build