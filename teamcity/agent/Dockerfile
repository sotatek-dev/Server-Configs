FROM jetbrains/teamcity-minimal-agent:2025.07-linux

USER root

RUN apt-get update \
    &&  apt-get install -y libgcc1 wget \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash \
    && \. "$HOME/.nvm/nvm.sh" \
    && nvm install 22 \
    && node -v \
    && nvm current \
    && corepack enable pnpm \
    && pnpm -v \
    && wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y dotnet-sdk-9.0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

