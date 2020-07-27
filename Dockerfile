FROM debian:10.4 as builder

WORKDIR /app

# Defines some environment variables for the Gatekeeper client.
ENV GKC_BASE_URL=https://storage.googleapis.com/github-action-artefacts/cloudInfra-golang-gatekeeper-client \
    GKC_VERSION=1.3.1 \
    GKC_ARCH=linux_amd64

# Installs dependencies for the installation.
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install curl ca-certificates

# Retrieves the Gatekeeper client binary.
RUN curl --silent "${GKC_BASE_URL}/${GKC_VERSION}/cloudInfra-golang-gatekeeper-client_${GKC_VERSION}_${GKC_ARCH}.tar.gz" | tar xvz

# Rebuilds the image with only the Gatekeeper client and certificates.
FROM debian:10.4-slim

COPY --from=builder /app/cloudInfra-golang-gatekeeper-client /usr/bin/gatekeeper-client
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

ENTRYPOINT ["gatekeeper-client"]
