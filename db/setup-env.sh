#!/bin/bash
# Update the ~/.bashrc 
# Sets up the environment variables with information used by the PG tools
# REQUIRES the region to be provided as an argument
if [ -z "$1" ]; then
    echo "Usage:  ./bin/set-env.sh  <AWS-Region> "
    echo "e.g.,   ./bin/set-env.sh  us-east-1"
    exit 
fi

# Check if backup file exists
BASHRC_BACKUP_FILE="/home/postgres/.bashrc-bup"
if test -f "$BASHRC_BACKUP_FILE"; then
  echo "Using $BBASHRC_BACKUP_FILE"
  # overwrite .bashrc file
  cp   $BASHRC_BACKUP_FILE /home/postgres/.bashrc
else
  cp /home/postgres/.bashrc  $BASHRC_BACKUP_FILE
  echo "Created $BBASHRC_BACKUP_FILE"
fi


export AWS_DEFAULT_REGION=$1
echo "export AWS_DEFAULT_REGION=\"$AWS_DEFAULT_REGION\"" >> /home/postgres/.bashrc

# If the cluster ID is already setup then use it, otherwise set to default
if [ -z "$PG_CLUSTER_ID" ]; then
  export PG_CLUSTER_ID=rdsa-postgresql-cluster
fi

echo "Using the PG_CLUSTER_ID=$PG_CLUSTER_ID"

echo "export PG_CLUSTER_ID=\"$PG_CLUSTER_ID\"" >> /home/postgres/.bashrc

export PGWRITEREP="$(aws rds describe-db-clusters  --db-cluster-identifier $PG_CLUSTER_ID | jq -r .DBClusters[0].Endpoint)"
echo "export PGWRITEREP=\"$PGWRITEREP\"" >> /home/postgres/.bashrc

export PGREADEREP=$(aws rds describe-db-clusters  --db-cluster-identifier $PG_CLUSTER_ID | jq -r .DBClusters[0].ReaderEndpoint)
echo "export PGREADEREP=\"$PGREADEREP\"" >> /home/postgres/.bashrc

export PGHOST=$PGWRITEREP
echo "export PGHOST=\"$PGHOST\"" >> /home/postgres/.bashrc

export PGPORT=5432
echo "export PGPORT=\"$PGPORT\"" >> /home/postgres/.bashrc

export PGUSER=postgres
echo "export PGUSER=\"$PGUSER\"" >> /home/postgres/.bashrc

export PGPASSWORD=postgres
echo "export PGPASSWORD=\"$PGPASSWORD\"" >> /home/postgres/.bashrc

export PGDATABASE=postgres
echo "export PGDATABASE=\"$PGDATABASE\"" >> /home/postgres/.bashrc

export PGTOOLS_ROOT="/home/postgres/pgbench-tools"
echo "export PGTOOLS_ROOT=\"$PGTOOLS_ROOT\"" >> /home/postgres/.bashrc
