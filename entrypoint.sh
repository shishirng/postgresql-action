#!/bin/sh

docker_run="docker run"
docker_run="$docker_run -e POSTGRES_DB=$INPUT_POSTGRESQL_DB"
docker_run="$docker_run -e POSTGRES_USER=$INPUT_POSTGRESQL_USER"
docker_run="$docker_run -e POSTGRES_PASSWORD=$INPUT_POSTGRESQL_PASSWORD"

if [ -n "$INPUT_POSTGRES_MULTIPLE_DATABASES" ];then
	echo "multiple dbs $INPUT_POSTGRES_MULTIPLE_DATABASES"
	docker_run="$docker_run -e POSTGRES_MULTIPLE_DATABASES=$INPUT_POSTGRES_MULTIPLE_DATABASES"
fi

docker_run="$docker_run -d -p 5432:5432 timescale/timescaledb:latest-pg12"

echo "Created default db $INPUT_POSTGRESQL_DB"

sh -c "$docker_run"
