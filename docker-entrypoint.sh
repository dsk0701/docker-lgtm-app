#! /bin/bash

set -e

export DEV_DATABASE_HOST=${MYSQL_PORT_3306_TCP_ADDR:-localhost}
export DEV_DATABASE_PASSWORD=${MYSQL_ENV_MYSQL_ROOT_PASSWORD:-dev}
export DEV_DATABASE_USERNAME=${DB_USER:-root}
export DEV_DATABASE_NAME=${DB_NAME:-lgtm}

bundle exec rake db:create
bundle exec rake db:migrate

exec "$@"
