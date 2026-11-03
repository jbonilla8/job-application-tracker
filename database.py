import os
import mysql.connector
from dotenv import load_dotenv

# Load environment variables from .env
load_dotenv()

# Database connection configuration
config = {
    'host': 'localhost',
    'user': 'root',
    'password': os.getenv('MYSQL_PASSWORD'),
    'database': 'job_tracker'
}

# Connect to the MySQL database
def get_db():
    try:
        connection = mysql.connector.connect(**config)
        return connection

    except mysql.connector.Error as error:
        print(f"Error connecting to MySQL: {error}")
        raise