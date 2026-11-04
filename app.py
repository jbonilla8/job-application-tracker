from flask import Flask, render_template
from database import get_db
import mysql.connector

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
@app.route("/companies")
def companies():
    conn = None
    cursor = None

    try:
        # Connect to MySQL database
        conn = get_db()
        cursor = conn.cursor(dictionary=True)

        # Retrieve all company information in alphabetical order
        cursor.execute("""
            SELECT *
            FROM companies
            ORDER BY company_name
        """)
        company_list = cursor.fetchall()

        # Send company data to the HTML template
        return render_template("companies.html", companies=company_list)

    except mysql.connector.Error:
        # Log database errors and display message
        app.logger.exception("Error loading companies")
        return "Unable to load companies.", 503

    finally:
        # Close the database connection
        if cursor is not None:
            cursor.close()
        if conn is not None and conn.is_connected():
            conn.close()


# Run the application
if __name__ == "__main__":
    app.run(debug=True)
