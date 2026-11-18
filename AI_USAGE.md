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
14. "How to use Bootstrap modals"
15. "How to fix a Bootstrap modal that doesn't scroll when the form has too many fields"
16. "How to make the tables responsive so they scroll horizontally on smaller screens"
17. "How to use Bootstrap progress bars"
18. "How to show matching skills above missing skills in the Job Match results"
19. "How do I create a schema.sql file using my existing MySQL table structures?"
20. "What should I put in requirements.txt for my Flask and MySQL project?"
21. "How do I update my README with installation and setup instructions?"
22. "How do I make the setup instructions work for both macOS and Windows?"
23. "How do I check that my .gitignore protects my database password?"
24. "How do I export my existing MySQL records without recreating the database tables"
25. "How do I clean up a MySQL data export and add optional sample data instructions to my README"
26. "How to adjust the table column widths without removing any columns"
27. "How to keep a horizontal scrollbar visible at the bottom of the browser window for responsive tables"
28. "How to hide the duplicate horizontal scrollbar while keeping the sticky scrollbar working"

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
- Used ChatGPT to help improve the page layout and apply consistent table and heading styles.
- Used ChatGPT to help convert the Add forms into Bootstrap modals with styled inputs and buttons.
- Used ChatGPT to help convert the Edit forms for Companies, Jobs, Applications, and Contacts into Bootstrap modals while keeping the existing functionality.
- Used ChatGPT to help fix the modal scrolling issue so the form fields can scroll while the buttons stay visible.
- Used ChatGPT to help make the tables responsive using Bootstrap so they scroll horizontally on smaller screens.
- Used ChatGPT to help redesign the Dashboard with a cleaner layout and progress bars for application statuses.
- Used ChatGPT to help style the Job Match form and ranked results with Bootstrap.
- Used ChatGPT to help display matching skills alongside missing skills without changing the matching algorithm.
- Used ChatGPT to help turn the table structures from MySQL Workbench into a schema.sql file.
- Used ChatGPT to identify the Python packages needed in requirements.txt.
- Used ChatGPT to improve the README with installation, database setup, and application instructions.
- Used ChatGPT to verify that the README's .env instructions matched database.py.
- Used ChatGPT to help export the existing MySQL records into a separate SQL file for testing the project on Windows.
- Used ChatGPT to help identify unnecessary MySQL replication settings in the exported SQL file.
- Used ChatGPT to help update the README with optional sample data import instructions.
- Used ChatGPT to help adjust the Jobs table column widths while keeping all existing information.
- Used ChatGPT to help add a sticky horizontal scrollbar that makes wide tables easier to navigate.
- Used ChatGPT to help replace the custom Delete dialogs with Bootstrap modals across all four tables.
- Tested the new Delete modals on Windows to make sure both Cancel and Delete worked correctly.

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
- Adjusted the page margins to give the navigation and tables more space while keeping them aligned.
- Moved Add button for forms to the top of pages.
- Chose to use popups (Bootstrap modals) for the Add forms instead of displaying them below the tables.
- Chose to apply table and heading styles globally through style.css instead of styling each page separately.
- Chose to make the Edit forms match the Add forms instead of having them appear below the tables.
- Noticed that the Edit Job modal wasn't scrolling properly and added a shared CSS fix in style.css so it works across the website.
- Chose to use compact outlined buttons with different colors for View, Edit, and Delete.
- Applied the same responsive table layout and action button styling across Companies, Jobs, Applications, and Contacts.
- Chose to use one simple statistics section instead of separate cards for each Dashboard statistic.
- Removed the progress bar for Total Applications because it would always show 100%.
- Simplified the Dashboard by removing unnecessary headings and descriptions.
- Changed the matching skill badges to green checkmarks and text without pill backgrounds.
- Copied the actual table definitions from MySQL Workbench to make sure schema.sql matched my database.
- Updated the README to describe the completed project instead of listing features as coming soon.
- Added Windows instructions because I also want to test the project and record my demonstration on a Windows computer.
- Checked my existing .gitignore and kept it unchanged because it already excluded sensitive and unnecessary files.
- Chose to keep the sample records in a separate SQL file instead of adding them to schema.sql.
- Removed unnecessary export comments and replication settings while keeping the sample records and database relationships intact.
- Added optional sample data instructions to the README so the project can be tested with either an empty or populated database.
- Chose to keep all the Jobs table columns instead of removing the less frequently used fields.
- Wanted the horizontal scrollbar to stay visible at the bottom of the browser window so users could tell the tables were scrollable.
- Removed the duplicate scrollbar underneath the table to keep the interface cleaner.
- Chose to make the Delete confirmation modals match the Add and Edit modals for a more consistent design.

## Lessons Learned
- Using a `.env` file keeps database credentials separate from the code and `.gitignore` prevents the file from being tracked by Git.
- AI-generated code should always be reviewed, understood, and tested.
- Best practice is to test each component individually for debugging purposes.
- Foreign key constraints prevent deleting company records that are still referenced by jobs or contacts.
- Using Bootstrap and shared CSS makes it easier to keep the website consistent across different pages.
- Testing forms with different inputs is important for catching validation errors and making sure database records are saved correctly.
- JSON columns are useful for storing information like job requirements, but the data needs to be validated before saving it to MySQL.
- A schema.sql file allows someone else to recreate the database structure, but it does not automatically include the existing records.
- Keeping requirements.txt and README.md updated makes it easier to set up and run the project on another computer.
- Testing the project on another computer helped me check whether the README instructions were clear and complete.
- Separating the database schema from sample data makes it easier to recreate and test the application on a new computer.
- Testing the website on a different computer helped me find layout issues that weren't as noticeable on my Mac.