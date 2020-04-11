#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e91edd42550a600192dc9eb/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e91edd42550a600192dc9eb
curl -s -X POST https://api.stackbit.com/project/5e91edd42550a600192dc9eb/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e91edd42550a600192dc9eb/webhook/build/publish > /dev/null
