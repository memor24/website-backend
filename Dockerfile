FROM python:3.8-slim

RUN apt update && \
    apt install -y --no-install-recommend \ 
# --flag to avoid installing unnecessary packages
    git && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

#install aws cli and sam cli
RUN pip3 install --no-cache-dir awscli aws-sam-cli
# to avoid caching python packages

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY app.py test.py template.yaml .

WORKDIR /app

EXPOSE 8080

# sh instead of bash to keep the image minimal and secure
CMD ["sh"]
