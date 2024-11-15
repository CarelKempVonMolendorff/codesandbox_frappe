# setup.sh

# Update and install dependencies
sudo apt-get update
sudo apt-get install -y python3-pip python3-dev mariadb-server libmariadb-dev-compat build-essential curl nodejs npm

# Set up MariaDB for Frappe
sudo service mysql start
sudo mysql -u root -e "CREATE USER 'frappe'@'localhost' IDENTIFIED BY 'frappe';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'frappe'@'localhost';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"

# Install Frappe Bench and necessary dependencies
pip3 install frappe-bench

# Initialize Frappe Bench
mkdir -p ~/frappe-bench
cd ~/frappe-bench
bench init frappe-bench --skip-redis-config-generation --skip-assets --skip-bench-metadata

# Create a new site and set it as the default site
cd frappe-bench
bench new-site site1.local --admin-password admin --no-mariadb-socket
bench use site1.local

# Add any apps (e.g., ERPNext) if needed
bench get-app erpnext
bench --site site1.local install-app erpnext