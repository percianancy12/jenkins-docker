# Use the official Python image as base
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Copy the Python app file into the container
COPY app.py /app/app.py

# Install Flask
RUN pip install flask

# Expose port 5000 for the Flask app
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]