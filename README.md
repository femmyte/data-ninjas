# ETL PROCESSES WITH BASH SCRIPT TO MANAGE CoreDataEngineers' data infrastructure

this project aim to perform a simple ETL processing that includes

1. **Extract**: it Download a CSV file usin curl from the internet and saved it
   inside the [raw dirctory](./raw/).
2. **Transform**: After downloading the file, a simple transformation was made
   to the file by renaming the column named Variable_code to variable_code.
   After whch, I selected year, Value, Units, and variable_code column, and
   saved the content of these selected columns into a file named
   2023_year_finance.csv. 2023_year_finance.csv file is saved in
   [Transformed directory](./Transformed/). The bash script confirm that every
   process ran succesfully by echoing each process.
3. **Load:** After transformation, the transformed data was finally moved to
   [Gold Directory](./Gold/).

> **NOTE:** This script is scheduled to run every day at 12:00 AM using cron
> jobs. the cronjob script can be found
> [here](./scripts/bash_scripts/cronjob.sh) you would have to run the
> [transform script](./scripts/bash_scripts/transform.sh) before having access
> to the Transformed and Gold directory

### The second part of the project aim to helps CoreDataEngineers to understand the market, analyzing their competitor called Parch and Posey's data. This is achieved by using the following steps:

1. Downloading the Parch and Posey data
2. Created a Bash script that iterates over and copies each of the CSV files
   into a PostgreSQL database, the name of the database is called posey.
3. After which a SQL script that performs the following were created
    - Find a list of order IDs where either gloss_qty or poster_qty is greater
      than 4000. Only include the id field in the resulting table.
    - Write a query that returns a list of orders where the standard_qty is zero
      and either the gloss_qty or poster_qty is over 1000.
    - Find all the company names that start with a 'C' or 'W', and where the
      primary contact contains 'ana' or 'Ana', but does not contain 'eana'.
    - Provide a table that shows the region for each sales rep along with their
      associated accounts. Your final table should include three columns: the
      region name, the sales rep name, and the account name. Sort the accounts
      alphabetically (A-Z) by account name.

## To use this script follow these instructions:

1. change directory to scripts/bash_script directory by using
   `cd scripts/bash_script`
2. Afterwards update the file permission of the following files.
   move_csv_and_json_files.sh, transform.sh, and cronjob.sh by running
   `chmod +x *.sh`
