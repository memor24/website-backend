FROM jenkins/jenkins:lts

RUN apt-get update && \
    apt-get install -y \
       python3 \
       python3-pip
RUN pip3 install aws-sam-cli

COPY app.py test.py template.yaml /var/lib/jenkins/workspace/

RUN chown -R jenkins:jenkins /var/lib/jenkins/workspace/
EXPOSE 8080
CMD ["/usr/local/bin/jenkins.sh", "-g", "headless"]