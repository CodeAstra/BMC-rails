#!/bin/bash

set -e

bundle check || bundle
# yarn

rm -f tmp/pids/server.pid
# # bin/webpack-dev-server &
rails s -b 0.0.0.0 -p 3000
