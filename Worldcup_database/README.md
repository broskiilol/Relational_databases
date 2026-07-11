# Build a Worldcup database - Certification Project
### Using SQL and bash to create a worldcup database and completeing queries

## Files given:
- `games.csv` - containing worldcup data and details
- `insert_data.sh` - bash file used to insert data from `.csv` file to the database
- `queries.sh` - bash file with given echo statements whose queries need to be filled

## Features:
- Created two tables: `games` and `teams` into which data from `games.csv` is fed using the `insert_data.sh` file
- Both tables can be joined using the `team_id` in `teams` table and `winner_id`,`opponent_id` in `games` table
