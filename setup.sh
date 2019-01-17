#!/usr/bin/env bash

set -euxo pipefail

docker build -t mbfisher/kaniko-multi-stage-bug:builder builder
docker push mbfisher/kaniko-multi-stage-bug:builder
docker build -t mbfisher/kaniko-multi-stage-bug:runtime runtime
docker push mbfisher/kaniko-multi-stage-bug:runtime