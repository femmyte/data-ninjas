#!/bin/bash

URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

echo "Downloading financial year-provisional data from CSV..."
curl -o ../../raw/annual_enterpise_survey.csv $URL
echo "file downloaded successfully"

# renaming the column named Variable_code to variable_code and moving it to a new file
echo "renaming the column named Variable_code to variable_code"
sed '1s/Variable_code/variable_code/' ../../raw/annual_enterpise_survey.csv > new.csv 
echo "variable renamed successfully inside a new file"
# changing directory to the base directory and creating Transformed directory inside it
echo "creating new directory"
mkdir ../../Transformed
echo "directory created successfully"
# using cut command to extract the required columns and saving it in 2023_year_finance.csv file
echo "using cut command to extract the required columns and saving it in Transformed directory" 
cut -d',' -f1,9,5-6 new.csv > ../../Transformed/2023_year_finance.csv
echo "data loaded inside the Transformed directory successfully"

echo "creating Gold directory"
mkdir ../../Gold
# copying the 2023_year_finance.csv file to the God directory
cp ../../Transformed/2023_year_finance.csv ../../Gold
echo "data copied successfully from Transformed directory to Gold directory"