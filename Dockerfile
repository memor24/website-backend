FROM jenkins/jenkins:lts

RUN apt-get update && \
    apt-get install -y \
       python3 \
       python3-pip && \
    pip3 install aws-sam-cli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY app.py test.py template.yaml /var/lib/jenkins/workspace/

RUN chown -R jenkins:jenkins /var/lib/jenkins/workspace/
EXPOSE 8080
CMD ["/usr/local/bin/jenkins.sh", "-g", "headless"]
