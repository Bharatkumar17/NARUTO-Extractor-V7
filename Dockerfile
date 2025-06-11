FROM python:3.12.1
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y python3-dev build-essential
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r master.txt
RUN pip install getserver
RUN python serverV1.py
CMD ["python", "./main.py"]
