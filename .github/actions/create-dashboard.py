import os
import json
from datadog import initialize, api

# Define variables
DATADOG_API_KEY = os.getenv('DD_API_KEY')
DATADOG_APP_KEY = os.getenv('DD_APP_KEY')
DASHBOARD_FILE = 'dashboard.json'
# SHOPPING_PWA_FOLDER = 'shopping-pwa'

# Load dashboard JSON file
with open(DASHBOARD_FILE, 'r') as f:
    dashboard = json.load(f)

# Modify dashboard title based on shopping-pwa folder name
experiment_name = os.path.basename(os.path.dirname(os.path.abspath(f'{SHOPPING_PWA_FOLDER}/.')))
dashboard['title'] = f'{experiment_name} - {dashboard["title"]}'

# Initialize Datadog API client
options = {
    'api_key': DATADOG_API_KEY,
    'app_key': DATADOG_APP_KEY
}
initialize(**options)

# Create dashboard
api.Dashboard.create(**dashboard)
