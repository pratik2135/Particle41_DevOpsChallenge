# Use minimal base image
FROM python:3.11-slim

# Create a non-root user
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Set working directory
WORKDIR /app

# Copy files and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY SimpleTimeServiceApp.py /app

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 8080

# Command to run the app
CMD ["python", "app.py"]


