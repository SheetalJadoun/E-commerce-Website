FROM python:3.9-slim-buster
RUN pip install datadog
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
