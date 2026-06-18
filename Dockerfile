FROM python:3.11-slim

WORKDIR /app

# Dependencies install karein
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Poora code copy karein
COPY . .

# Data aur user_files folders create karein
RUN mkdir -p /app/data /app/user_files

# Railway ka PORT use karein
ENV PORT=8080
EXPOSE $PORT

# Flask app run karein
CMD ["gunicorn", "-w", "1", "--threads", "8", "-b", "0.0.0.0:8080", "app:app"]
