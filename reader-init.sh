#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o noclobber
set -o pipefail

until mysqladmin ping -h "writer" -u "${MYSQL_WRITER_REPL_USER}" -p"${MYSQL_WRITER_REPL_PASSWORD}" --silent; do
  sleep 1
done

mysql -u root -p"${MYSQL_READER_ROOT_PASSWORD}" -e "
change master to
  master_host='writer',
  master_port=3306,
  master_user = '${MYSQL_WRITER_REPL_USER}',
  master_password = '${MYSQL_WRITER_REPL_PASSWORD}',
  master_auto_position = 1;

start slave;
"
