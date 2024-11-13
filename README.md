# Frappe Bench CodeSandbox Environment

This CodeSandbox setup installs Frappe Bench with its dependencies, configures MariaDB, and initializes a Frappe site with ERPNext.

## Structure

- `.codesandbox/sandbox.config.json` – Configures CodeSandbox to run setup and start commands.
- `setup.sh` – Sets up Frappe Bench, installs dependencies, creates a Frappe site, and installs apps like ERPNext.

## Usage

On initialization, CodeSandbox will:
1. Run `setup.sh` to install and configure Frappe Bench.
2. Start the Frappe server.

Access Frappe via the forwarded port displayed in CodeSandbox.