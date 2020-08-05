ARG DOTNET_VERSION=5.0
FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_VERSION} AS build
ARG EF_VERSION=5.0.0-preview.7.20365.15

RUN apt-get update && \
    apt-get install -y --no-install-recommends dos2unix apt-utils && \
    rm -rf /var/lib/apt/lists/*

# Install EntityFrameworks CLI
RUN dotnet tool install --global dotnet-ef --version ${EF_VERSION}
ENV PATH="${PATH}:/root/.dotnet/tools"
