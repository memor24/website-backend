FROM python:3.8-slim

#install aws cli and sam cli
RUN pip3 install --no-cache-dir awscli aws-sam-cli
# to avoid caching python packages

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

WORKDIR /app

COPY app.py test.py template.yaml ./

EXPOSE 8080

CMD ["python3", "app.py"]
