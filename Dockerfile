# Stage 1: Builder
FROM python:3.9-slim-buster AS builder

# Set the working directory inside the container
WORKDIR /app

# Update the package lists and install necessary build tools and libraries
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        libpq-dev \
        gettext && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies into a separate directory with no cache
RUN pip install --prefix=/install --no-cache-dir -r requirements.txt

# Stage 2: Runtime
FROM python:3.9-slim-buster

# Set the working directory inside the container
WORKDIR /app

# Update package lists and install runtime dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gettext && \
    rm -rf /var/lib/apt/lists/*

# Copy dependencies from the builder stage into the final image
COPY --from=builder /install /usr/local

# Copy the app's source code into the final image
COPY . .

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    DJANGO_SETTINGS_MODULE=dawamkononi.settings

# Expose the port the app runs on
EXPOSE 8000


# Command to run the app with Gunicorn
CMD ["gunicorn", "dawamkononi.wsgi:application", "--bind", "0.0.0.0:8000"]
