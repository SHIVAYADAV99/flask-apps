# ...existing code...
FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1
WORKDIR /app

# Install build dependencies and runtime packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

# Install Python deps (install minimal set directly to avoid missing requirements file)
RUN pip install --no-cache-dir flask gunicorn

# Copy app sources
COPY . /app

# Expose the port Gunicorn will bind to
EXPOSE 8000

# Run Gunicorn using the wsgi module that imports the Flask app
CMD ["gunicorn", "--workers", "3", "--bind", "0.0.0.0:8000", "wsgi:app"]
# ...existing code...
