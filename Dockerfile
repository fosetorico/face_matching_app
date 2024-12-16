# Base image with Python 3.8
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Copy application files to the container
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the Streamlit port
EXPOSE 8501

# Entry point to run the Streamlit app
ENTRYPOINT ["streamlit", "run"]
CMD ["app.py"]
