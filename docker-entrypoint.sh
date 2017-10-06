#! /bin/bash

set -e

export DEV_DATABASE_USERNAME=${DB_USER:-root}
export DEV_DATABASE_PASSWORD=${DB_PASSWORD}
export DEV_DATABASE_NAME=${DB_NAME:-lgtm}

bundle exec rake db:create
bundle exec rake db:migrate
