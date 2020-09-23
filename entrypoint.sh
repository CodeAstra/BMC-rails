#!/bin/bash

set -e

bundle check || bundle
rm -f tmp/pids/server.pid
rails s -b 0.0.0.0 -p 3000
