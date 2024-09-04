#!/bin/bash

# Variables
# DB_NAME="newposey"
DB_USER="postgres"
DB_HOST="localhost"
DB_PORT="5432"
CSV_DIR="../../raw/parch_posey"

# sudo su - postgres

read -p "Enter your database name : " DB_NAME

# create database
psql -c $DB_NAME

# Iterate over each CSV file in the directory
for file in "$CSV_DIR"/*.csv
do
  # Extract table name from the CSV file name 
  table_name=$(basename "$file" .csv)

  echo "Processing $file for table $table_name"

  # Read the first line (header) of the CSV file to get column names
  header=$(head -n 1 "$file")
  
  # Generate the table schema
  schema=""
  IFS=',' read -ra columns <<< "$header"
  for col in "${columns[@]}"; do
    # Use double quotes for column names to avoid issues with special characters or reserved words
    schema+=$(printf "\"%s\" TEXT," "$col")
  done
  schema=${schema%,}  # Remove trailing comma

  # Create the table with the generated schema
  echo 'the schema ' $schema
  psql -U "$DB_USER" -d "$DB_NAME" -h "$DB_HOST" -p "$DB_PORT" -c "
    CREATE TABLE IF NOT EXISTS \"$table_name\" ($schema);
  "

  # Import the CSV file into the PostgreSQL table
  # psql -U "$DB_USER" -d "$DB_NAME" -h "$DB_HOST" -p "$DB_PORT" -c "
  #   LOAD DATA LOCAL INFILE '$table_name' INTO TABLE "$table_name"
  #   FIELDS TERMINATED BY ','
  #   LINES TERMINATED BY '\n'
  #   ENCLOSED BY '\"'
  #   ESCAPE '\"'
  #   IGNORE 1 LINES;
  #   # COPY \"$table_name\" FROM '$file' WITH CSV HEADER;
  # "

  echo "$file imported successfully into table $table_name"
done







