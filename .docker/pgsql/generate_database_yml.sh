#!/bin/bash

# Đọc các biến từ file .env
export $(grep -v '^#' .env | xargs)

# Thông báo tạo file
echo "Generating database.yml"

# Tạo nội dung của file database.yml (YAML format)
# cat <<EOF > .docker/pgsql/database.yml
# default: &default
#   adapter: postgresql
#   encoding: unicode
#   host: ${DB_HOST:-db}
#   username: ${POSTGRES_USER:-postgres}
#   password: ${POSTGRES_PASSWORD:-postgres}
#   pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

# development:
#   <<: *default
#   database: ${POSTGRES_DB:-sample_app_development}
# EOF

cat <<EOF > config/database.yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: ${DB_HOST:-db}
  username: ${POSTGRES_USER:-postgres}
  password: ${POSTGRES_PASSWORD:-postgres}
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: ${POSTGRES_DB:-same_rails}
EOF

# Thông báo hoàn thành
echo "database.yml has been generated in the .docker/pgsql/ folder."
