# AI Usage Documentation

## Tools Used
- **ChatGPT** — Used for development guidance, Python/Flask code, and debugging.

## Key Prompts
1. "How to load environment variables from a .env file into a Python Flask application"
2. "How to create reusable base HTML template in Flask"
3. "How to retrieve data from MySQL and display it on a Flask HTML template"

## What Worked Well
- Adapted Python database connection code from Assignment 5 for use with Flask.
- Successfully tested the Python-to-MySQL connection.
- Used AI assistance to create the initial Flask application and HTML templates.

## What I Modified
- Reused existing Assignment 5 code instead of replacing it entirely.
- Added exception handling to the database connection function.
- Chose to store database password in a `.env` file instead of hardcoding it.
- Adjusted the database schema to match the final project specifications.
- Added database error handling to the Flask dashboard.

## Lessons Learned
- Using a `.env` file keeps database credentials separate from the code and `.gitignore` prevents the file from being tracked by Git.
- AI-generated code should always be reviewed, understood, and tested.
- Best practice is to test each component individually for debugging purposes.