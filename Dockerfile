FROM python:3.13-slim
WORKDIR /app
COPY app/requirements.txt .
RUN pip install -r requirements.txt
COPY app/app.py .
RUN useradd -u 1000 u && mkdir /data && chown -R u:u /app /data
USER u
CMD ["python", "app.py"]
