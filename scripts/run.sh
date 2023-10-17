#!/bin/sh

# Run Teller
echo "Running Teller"
python /Teller/teller.py -d /statements -n teller

# Make necessary ouput dirs
mkdir -p /output

# Export to CSV
echo "Exporting to CSV"
sqlite3 -header -csv teller.db "select * from transactions;" > /output/transactions.csv