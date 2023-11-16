# Stage 1: Build
FROM python:3.7.4-slim-buster as builder

# Set the working directory in the builder stage
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --user -r requirements.txt

# Stage 2: Production Build
FROM python:3.7.4-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the virtual environment from the builder stage
COPY --from=builder /root/.local /root/.local

# Copy the current directory contents into the container at /app
COPY . .

# Make sure scripts in .local are usable:
ENV PATH=/root/.local:$PATH

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Start Gunicorn and serve the app
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
