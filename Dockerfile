# Basierend auf dem Python 3.7.4 Slim-Buster Image
FROM python:3.7.4-slim-buster

# Setzt das Arbeitsverzeichnis im Container auf /app
WORKDIR /app

# Kopiert die Dateien aus dem aktuellen Verzeichnis in das /app Verzeichnis im Container
COPY . .

# Installiert die benötigten Pakete aus der requirements.txt Datei
RUN pip install -r requirements.txt

# Legt den Port fest, auf dem die Anwendung im Container läuft
EXPOSE 5000

# Startet die Flask-Anwendung
CMD ["python", "app.py", "--host=0.0.0.0"]