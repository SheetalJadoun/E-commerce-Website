#!/bin/sh -l

datadog_api_key: ${{ secrets.DATADOG_API_KEY }}
datadog_app_key: ${{ secrets.DATADOG_APP_KEY }}
dashboard_name="Dashboard Template"

echo "Creating Datadog dashboard ${dashboard_name}..."

curl -X POST -H "Content-type: application/json" \
-d "{\"title\":\"${dashboard_name}\",\"widgets\":[{\"type\":\"timeseries\",\"title\":\"CPU Usage\",\"requests\":[{\"q\":\"avg:system.cpu.user{*}\"}],\"yaxis\":{\"scale\":\"linear\",\"min\":0,\"max\":100},\"autoscale\":true}]}" \
"https://api.datadoghq.com/api/v1/dashboard?api_key=${datadog_api_key}&application_key=${datadog_app_key}"
