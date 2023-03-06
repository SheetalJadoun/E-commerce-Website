- name: My Action
  uses: /.github/actions
  with:
    datadog_api_key: ${{ secrets.DATADOG_API_KEY }}
    datadog_app_key: ${{ secrets.DATADOG_APP_KEY }}
    title: "My Dashboard"
    widgets: |
      [{
        "type": "timeseries",
        "title": "CPU usage",
        "queries": [
          {
            "query": "avg:system.cpu.user{*}"
          }
        ],
        "yaxis": {
          "scale": "linear",
          "min": 0,
          "max": 100
        },
        "autoscale": true
      }]
