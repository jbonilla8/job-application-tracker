# Job Application Tracker

A web application to help track job applications during the job search process. Users can organize companies, job listings, applications, and professional contacts in one place.

## Features

- **Dashboard:** View the total number of applications and statistics for each application status.
- **Companies:** Add, view, edit, and delete company information.
- **Jobs:** Add, view, edit, and delete job listings, including salaries, descriptions, and required skills.
- **Applications:** Track job applications, application dates, statuses, resumes, and interview information.
- **Contacts:** Manage professional contacts associated with companies.
- **Job Match:** Enter a list of skills and find jobs ranked by matching percentage, including matching and missing skills.

## Technologies

- Python
- Flask
- MySQL
- HTML and CSS
- Bootstrap 5
- Jinja2
- MySQL Connector/Python
- python-dotenv

## Requirements

- Python 3
- MySQL 8.0 or newer
- pip

## Installation and Setup

### 1. Clone the Repository

Clone the GitHub repository and open the project folder in a terminal.


### 2. Create a Virtual Environment

**On macOS:**

```bash
python3 -m venv .venv
source .venv/bin/activate
```

**On Windows (PowerShell):**

```powershell
py -m venv .venv
.\.venv\Scripts\Activate.ps1
```

After activating the virtual environment, continue with Step 3 to install the project dependencies.


### 3. Install Dependencies

```bash
pip install -r requirements.txt
```


### 4. Set Up the Database

Make sure MySQL is installed and running.

Run the `schema.sql` file in MySQL Workbench to create the `job_tracker` database and its four tables:

- `companies`
- `jobs`
- `applications`
- `contacts`

The schema creates empty tables. Records can be added through the application.


### 5. Configure Database Credentials

Create a `.env` file in the main project folder.

Add the following line:

```env
MYSQL_PASSWORD=your_mysql_password
```

Replace `your_mysql_password` with the password for your local MySQL `root` user.

The application connects to MySQL using these settings:

- Host: `localhost`
- Username: `root`
- Database: `job_tracker`
- Password: Loaded from the `.env` file

Make sure the MySQL server is running before starting the application.

Do not commit the `.env` file to GitHub because it contains your database password.


### 6. Run the Application

From the project folder, run:

**On macOS:**

```bash
python3 app.py
```

**On Windows:**

```powershell
python app.py
```

Open the local address displayed in the terminal in your web browser.


## Using the Application

Use the navigation bar to access the Dashboard, Companies, Jobs, Applications, Contacts, and Job Match pages.

Records can be added, viewed, edited, and deleted through the interface.

To use Job Match, enter skills separated by commas. The application compares those skills with job requirements and displays matching jobs ranked by percentage.

## Database Structure

The application uses four related MySQL tables:

- **Companies:** Stores company information.
- **Jobs:** Stores job listings associated with companies.
- **Applications:** Stores applications associated with jobs.
- **Contacts:** Stores contacts associated with companies.

The database also uses foreign keys, indexes, and JSON columns to support application features.
