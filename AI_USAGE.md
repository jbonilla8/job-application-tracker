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
9. "How to make delete confirmation popups show which record will be deleted without displaying the localhost browser heading"
10. "How to make a job matching feature that compares my skills to job requirements, ranks the jobs by match percentage, and shows which skills I'm missing"
11. "How to add detail views for individual records in Flask so users can see their information without editing it"
12. "How to use Bootstrap to make the navigation responsive with a hamburger menu on smaller screens"
13. "How to make a responsive navigation bar with Bootstrap, a mobile hamburger menu, and a way to highlight the current page"

## What Worked Well
- Adapted Python database connection code from Assignment 5 for use with Flask.
- Successfully tested the Python-to-MySQL connection.
- Used ChatGPT to create the initial Flask application and HTML templates.
- Used ChatGPT to help pass data from Flask to HTML templates using Jinja.
- Used ChatGPT to help handle form submissions in Flask and save company data to MySQL.
- Used ChatGPT to help implement editing company records and detect changes in form fields.
- Used ChatGPT to help implement company deletion with a confirmation dialog and handle foreign key errors in Flask.
- Used ChatGPT to help validate JSON requirements before saving job records to MySQL.
- Used ChatGPT to help implement custom HTML and JavaScript delete confirmation dialogs for all four tables.
- Used ChatGPT to help build the Job Match algorithm to calculate match percentages and identify matching and missing skills.
- Used ChatGPT to help create Flask routes and HTML templates for displaying individual record details.
- Used ChatGPT to help style the navigation bar with Bootstrap and add a mobile side menu.
- Used ChatGPT to help create a responsive Bootstrap navigation bar with a mobile side menu and active page highlighting.

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
- Chose to improve the Delete confirmation dialogs so they identify the specific record being deleted instead of showing a generic message.
- Replaced the default browser confirmation popups with custom dialogs for a more consistent interface.
- Changed the Job Match results from a table to a numbered list showing match percentages, skill counts, and missing skills to better match the project specification example.
- Chose to display only jobs with matching skills instead of including 0% matches or jobs without specified requirements.
- Added hamburger menu for navigation links on smaller screen sizes.
- Removed the duplicate website title and adjusted the navigation spacing so the hamburger menu sits closer to the left edge on mobile.
- Chose a subtle background highlight instead of an underline for the active navigation link and adjusted the styling to prevent the links from shifting.

## Lessons Learned
- Using a `.env` file keeps database credentials separate from the code and `.gitignore` prevents the file from being tracked by Git.
- AI-generated code should always be reviewed, understood, and tested.
- Best practice is to test each component individually for debugging purposes.
- Foreign key constraints prevent deleting company records that are still referenced by jobs or contacts.