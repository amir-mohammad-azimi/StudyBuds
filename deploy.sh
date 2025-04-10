#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

docker compose up -d --force-recreate postgres
docker compose up -d caddy duckdns
docker compose up -d --build --force-recreate backend unigelogin unigeapi
docker compose run --rm migration
docker compose run --rm --build database-data
# docker system prune -af
