#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o noclobber
set -o pipefail

mysql -uroot -p"${MYSQL_WRITER_ROOT_PASSWORD}" -e "
create user ${MYSQL_WRITER_REPL_USER}@'%' identified by '${MYSQL_WRITER_REPL_PASSWORD}';

grant replication slave on *.* to '${MYSQL_WRITER_REPL_USER}'@'%';
"
