#!/usr/bin/env bash

curl -XPUT http://api.dev.bizlunch.fr:9200/items -d "$(cat logger-es-index.json)"
