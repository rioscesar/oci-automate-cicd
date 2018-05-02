docker network create jenkins-tier
docker run -d --name jenkins -p 80:8080 -p 443:8443 \
  --net jenkins-tier \
  --volume /path/to/jenkins-persistence:/bitnami \
  bitnami/jenkins:latest
