# AI Usage Documentation

## Tools Used
- **ChatGPT** — Used for development guidance, Python/Flask code, and debugging.

## Key Prompts
1. "How to load environment variables from a .env file into a Python Flask application"
2. "How to create reusable base HTML template in Flask"
3. "How to retrieve data from MySQL and display it in a Flask HTML template"
4. "How to handle POST requests in Flask and save form data to MySQL"
5. "How to update existing records using Flask and MySQL"
6. "How to enable the Save Changes button only when form data changes"
7. "How to delete records in Flask with confirmation and foreign key protection"
8. "How to validate JSON input in Flask before saving it to MySQL"

## What Worked Well
- Adapted Python database connection code from Assignment 5 for use with Flask.
- Successfully tested the Python-to-MySQL connection.
- Used ChatGPT to create the initial Flask application and HTML templates.
- Used ChatGPT to help pass data from Flask to HTML templates using Jinja.
- Used ChatGPT to help handle form submissions in Flask and save company data to MySQL.
- Used ChatGPT to help implement editing company records and detect changes in form fields.
- Used ChatGPT to help implement company deletion with a confirmation dialog and handle foreign key errors in Flask.
- Used ChatGPT to help validate JSON requirements before saving job records to MySQL.

## What I Modified
- Reused existing Assignment 5 code instead of replacing it entirely.
- Added exception handling to the database connection function.
- Chose to store database password in a `.env` file instead of hardcoding it.
- Adjusted the database schema to match the final project specifications.
- Added database error handling to the Flask dashboard.
- Displayed all relevant company information rather than just a few select fields without showing database IDs or timestamps.
- Kept the Add Company form on the Companies page instead of creating a separate page.
- Hid the Add Company form until the Add Company button is clicked.
- Kept the company ID in the URL while editing, but cleared it when the page is refreshed.
- Kept the Save Changes button disabled until the Edit Company form data was actually changed.
- Shortened the Jobs table headers to make them more concise and easier to read.

## Lessons Learned
- Using a `.env` file keeps database credentials separate from the code and `.gitignore` prevents the file from being tracked by Git.
- AI-generated code should always be reviewed, understood, and tested.
- Best practice is to test each component individually for debugging purposes.
- Foreign key constraints prevent deleting company records that are still referenced by jobs or contacts.