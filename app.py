from flask import Flask, render_template, request, redirect, url_for
from database import get_db
import mysql.connector
import json

# Create the Flask application
app = Flask(__name__)


# Dashboard page
@app.route("/")
def dashboard():
    conn = None
    cursor = None

    try:
        # Connect to MySQL database
        conn = get_db()

        # Get the total number of job applications
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT COUNT(*) AS total_applications FROM applications")
        stats = cursor.fetchone()

        # Get the number of applications for each status
        cursor.execute("""
            SELECT status, COUNT(*) AS total
            FROM applications
            GROUP BY status
        """)
        status_counts = {row["status"]: row["total"] for row in cursor.fetchall()}

        # Send application statistics data to the dashboard template
        return render_template(
            "dashboard.html", stats=stats, status_counts=status_counts
        )

    except mysql.connector.Error:
        # Log database errors and display message
        app.logger.exception("Error loading dashboard statistics")
        return "Unable to load dashboard statistics.", 503

    finally:
        # Close the database connection
        if cursor is not None:
            cursor.close()
        if conn is not None and conn.is_connected():
            conn.close()


# Companies page
@app.route("/companies", methods=["GET", "POST"])
def companies():
    conn = None
    cursor = None

    try:
        # Connect to MySQL database
        conn = get_db()
        cursor = conn.cursor(dictionary=True)

        # Delete a company when the delete form is submitted
        if request.method == "POST" and request.form.get("form_action") == "delete":
            company_id = request.form.get("company_id", type=int)

            # Validate the company ID
            if company_id is None:
                return "Valid company ID is required.", 400

            try:
                # Delete the selected company from MySQL
                cursor.execute(
                    "DELETE FROM companies WHERE company_id = %s",
                    (company_id,),
                )
                conn.commit()

            except mysql.connector.IntegrityError:
                # Prevent deleting companies with related jobs or contacts
                return "Cannot delete a company with related jobs or contacts.", 409

            # Return to the Companies page
            return redirect(url_for("companies"))

        # Update an existing company when the edit form is submitted
        if request.method == "POST" and request.form.get("form_action") == "edit":
            company_id = request.form.get("company_id", type=int)
            company_name = request.form.get("company_name", "").strip()

            # Validate the company ID and required name
            if company_id is None or not company_name:
                return "Valid company ID and name are required.", 400

            # Get updated company information from the form
            company_data = (
                company_name,
                request.form.get("industry") or None,
                request.form.get("website") or None,
                request.form.get("city") or None,
                request.form.get("state") or None,
                request.form.get("notes") or None,
                company_id,
            )

            # Update the selected company in MySQL
            cursor.execute(
                """
                UPDATE companies
                SET company_name = %s,
                    industry = %s,
                    website = %s,
                    city = %s,
                    state = %s,
                    notes = %s
                WHERE company_id = %s
                """,
                company_data,
            )
            conn.commit()

            # Return to the Companies page
            return redirect(url_for("companies"))

        # Add a new company when the form is submitted
        if request.method == "POST":
            company_name = request.form.get("company_name", "").strip()

            # Validate the required company name
            if not company_name:
                return "Company name is required.", 400

            # Get company information from the form
            company_data = (
                company_name,
                request.form.get("industry") or None,
                request.form.get("website") or None,
                request.form.get("city") or None,
                request.form.get("state") or None,
                request.form.get("notes") or None,
            )

            # Insert the new company into MySQL
            cursor.execute(
                """
                INSERT INTO companies
                    (company_name, industry, website, city, state, notes)
                VALUES (%s, %s, %s, %s, %s, %s)
            """,
                company_data,
            )
            conn.commit()

            # Return to the Companies page
            return redirect(url_for("companies"))

        # Retrieve all company information in alphabetical order
        cursor.execute("""
            SELECT *
            FROM companies
            ORDER BY company_name
        """)
        company_list = cursor.fetchall()

        # Retrieve the company selected for editing by id
        edit_company = None
        company_id = request.args.get("edit", type=int)

        if company_id is not None:
            cursor.execute(
                "SELECT * FROM companies WHERE company_id = %s",
                (company_id,),
            )
            edit_company = cursor.fetchone()

        # Send company data to the HTML template
        return render_template(
            "companies.html",
            companies=company_list,
            edit_company=edit_company,
        )

    except mysql.connector.Error:
        # Log database errors and display message
        app.logger.exception("Error loading or saving companies")
        return "Unable to load or save companies.", 503

    finally:
        # Close the database connection
        if cursor is not None:
            cursor.close()
        if conn is not None and conn.is_connected():
            conn.close()


# Jobs page
@app.route("/jobs", methods=["GET", "POST"])
def jobs():
    conn = None
    cursor = None

    try:
        # Connect to MySQL database
        conn = get_db()
        cursor = conn.cursor(dictionary=True)

        # Add a new job when the form is submitted
        if request.method == "POST":
            company_id = request.form.get("company_id", type=int)
            job_title = request.form.get("job_title", "").strip()

            # Validate the required fields
            if company_id is None or not job_title:
                return "Company and job title are required.", 400

            # Validate the JSON requirements
            requirements = request.form.get("requirements", "").strip() or None

            if requirements:
                try:
                    skills = json.loads(requirements)
                except json.JSONDecodeError:
                    return "Requirements must contain valid JSON.", 400

                if not isinstance(skills, list) or not all(
                    isinstance(skill, str) for skill in skills
                ):
                    return "Requirements must be a JSON list of skills.", 400

            # Get job information from the form
            job_data = (
                company_id,
                job_title,
                request.form.get("job_type") or None,
                request.form.get("salary_min", type=int),
                request.form.get("salary_max", type=int),
                request.form.get("job_url") or None,
                request.form.get("date_posted") or None,
                requirements,
                request.form.get("job_description") or None,
                1 if request.form.get("is_active") == "on" else 0,
            )

            # Insert the new job into MySQL
            cursor.execute(
                """
                INSERT INTO jobs (
                    company_id, job_title, job_type,
                    salary_min, salary_max, job_url,
                    date_posted, requirements, job_description, is_active
                )
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """,
                job_data,
            )
            conn.commit()

            # Return to the Jobs page
            return redirect(url_for("jobs"))

        # Retrieve jobs with their company names
        cursor.execute("""
            SELECT jobs.*, companies.company_name
            FROM jobs
            JOIN companies ON jobs.company_id = companies.company_id
            ORDER BY companies.company_name, jobs.job_title
        """)
        job_list = cursor.fetchall()

        # Retrieve companies for the Add Job dropdown
        cursor.execute("""
            SELECT company_id, company_name
            FROM companies
            ORDER BY company_name
        """)
        company_list = cursor.fetchall()

        # Send job and company data to the HTML template
        return render_template(
            "jobs.html",
            jobs=job_list,
            companies=company_list,
        )

    except mysql.connector.Error:
        # Log database errors and display message
        app.logger.exception("Error loading jobs")
        return "Unable to load jobs.", 503

    finally:
        # Close the database connection
        if cursor is not None:
            cursor.close()
        if conn is not None and conn.is_connected():
            conn.close()


# Run the application
if __name__ == "__main__":
    app.run(debug=True)
