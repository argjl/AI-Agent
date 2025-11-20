FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY app ./app

# Expose default port (for local run)
EXPOSE 8080

# Start FastAPI server, using Render's $PORT if available
CMD uvicorn app.server:app --host 0.0.0.0 --port ${PORT:-8080}