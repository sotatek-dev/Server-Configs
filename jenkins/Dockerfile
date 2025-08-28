FROM jenkins/jenkins:2.516.2-lts-slim
USER root

RUN apt-get update \
   &&  apt-get install -y lsb-release ca-certificates curl wget nodejs \
   &&  curl -fsSL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh \
   &&  bash nodesource_setup.sh \
   &&  wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
   &&  dpkg -i packages-microsoft-prod.deb \
   &&  rm packages-microsoft-prod.deb \
   &&  apt-get update \
   &&  apt-get install -y nodejs dotnet-sdk-9.0 \
   &&  npm install -g yarn@1.22.22 \
   &&  install -m 0755 -d /etc/apt/keyrings \
   &&  curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc \
   &&  chmod a+r /etc/apt/keyrings/docker.asc \
   &&  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release \
   &&  echo \"$VERSION_CODENAME\") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
   &&  apt-get update \
   &&  apt-get install -y docker-ce-cli \
   &&  apt-get clean \
   &&  rm -rf /var/lib/apt/lists/*

USER jenkins

RUN jenkins-plugin-cli --plugins "blueocean docker-workflow json-path-api"
