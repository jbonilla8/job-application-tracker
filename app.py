from flask import Flask, render_template

# Create the Flask application
app = Flask(__name__)

# Dashboard page
@app.route('/')
def dashboard():
    return render_template('dashboard.html')

# Run the application
if __name__ == '__main__':
    app.run(debug=True)