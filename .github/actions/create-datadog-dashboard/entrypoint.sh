#!/bin/sh -l

datadog_api_key=$1
datadog_app_key=$2
dashboard_name=$3

echo "Creating Datadog dashboard ${dashboard_name}..."

curl -X POST -H "Content-type: application/json" \
-d "{\"title\":\"${dashboard_name}\",\"widgets\":[{\"type\":\"timeseries\",\"title\":\"CPU Usage\",\"requests\":[{\"q\":\"avg:system.cpu.user{*}\"}],\"yaxis\":{\"scale\":\"linear\",\"min\":0,\"max\":100},\"autoscale\":true}]}" \
"https://api.datadoghq.com/api/v1/dashboard?api_key=${datadog_api_key}&application_key=${datadog_app_key}"
