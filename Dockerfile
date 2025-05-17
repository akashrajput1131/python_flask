# Use a minimal base image
FROM python:3.9-slim

# Install dependencies needed to build wheels
RUN apk add --no-cache gcc musl-dev libffi-dev

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app
COPY app.py .

# Expose Flask default port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
