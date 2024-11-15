# setup.sh

# Update and install dependencies
sudo apt-get update
sudo apt-get install -y python3-pip python3-dev build-essential curl nodejs npm

# Create a directory for the Frappe Bench environment
mkdir -p ~/frappe-bench
cd ~/frappe-bench

# Set up a Python virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Install Frappe Bench within the virtual environment
pip install frappe-bench

# Initialize Frappe Bench (this will create the frappe-bench folder inside ~/frappe-bench)
# Specify --db-type sqlite to use SQLite instead of MariaDB
bench init frappe-bench --db-type sqlite --skip-redis-config-generation --skip-assets --skip-bench-metadata

# Change to the frappe-bench directory
cd frappe-bench

# Create a new Frappe site using SQLite as the database
bench new-site site1.local --admin-password admin --db-type sqlite

# Set the new site as the default site
bench use site1.local

# Add any apps (e.g., ERPNext) if needed
bench get-app erpnext
bench --site site1.local install-app erpnext
