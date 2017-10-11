#! /bin/bash

set -e

export DEV_DATABASE_HOST=${DB_HOST:-localhost}
export DEV_DATABASE_PORT=${DB_PORT:-3306}
export DEV_DATABASE_PASSWORD=${DB_PASSWORD:-dev}
export DEV_DATABASE_USERNAME=${DB_USER:-root}
export DEV_DATABASE_NAME=${DB_NAME:-lgtm}

dockerize -wait tcp://${DEV_DATABASE_HOST}:${DEV_DATABASE_PORT} -timeout ${DB_BOOT_WAIT_TIMEOUT_SEC:-30s}
bundle exec rake db:create
bundle exec rake db:migrate

exec "$@"
