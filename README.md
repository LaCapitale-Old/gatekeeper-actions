# Gatekeeper Client

This repository contains helpers to use the Gatekeeper client.

## Docker image

The `Dockerfile` file builds a Docker image containing the Gatekeeper client. When the image is run, the command is passed to the client.

Images are publicly stored in [Docker Hub](https://hub.docker.com/r/lacapitale/gatekeeper-client), and also in the repository's [registry](https://github.com/LaCapitale/gatekeeper-actions/packages).

### Usage

To request Gatekeeper to pull the `gcr.io/project-id/image:tag` image into the corporate container registry:

    docker run --rm lacapitale/gatekeeper-client:v0.1.1 \
      -serverURL=gatekeeper.infra1.lacapitale-gcp.com \
      -serverPort=443 \
      -clientID=$CLIENT_ID \
      -apiKey=$API_KEY \
      -logStreaming=true \
      -grpcURL=gatekeeper-grpc.infra1.lacapitale-gcp.com \
      -grpcPort=443 \
      -serviceType=RELEASE_IMG \
      -registryType=GCR \
      -imageName=gcr.io/project-id/image:tag

## GitHub actions

Two GitHub actions are provided as helpers when using the Gatekeeper client during a continuous delivery flow. Both require a client id and an API key to authenticate to the Gatekeeper server.

### `gatekeeper-helm`

This action installs the specified [Helm](https://helm.sh/) [chart](https://helm.sh/docs/topics/charts/) into the corporate [Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine/).

See [the action](./.github/actions/gatekeeper-helm/README.md) for more information.

#### Usage

The following deploys the Helm chart located at `github.com/LaCapitale/example/helm/example`:

    uses: LaCapitale/gatekeeper-actions/.github/actions/gatekeeper-helm@v0.1.1
    with:
      gatekeeper-client-id: client_id
      gatekeeper-api-key: ${{ secrets.GATEKEEPER_API_KEY }}
      ops-repo: github.com/LaCapitale/example
      ops-repo-helm-chart-path: /helm/example
      helm-release-name: example-v0
      target-cluster: DEV
      target-namespace: example-v0-stg

### `gatekeeper-image`

This action pushes a [Docker](https://www.docker.com/) image to the corporate [Google Container Registry](https://cloud.google.com/container-registry/).

See [the action](./.github/actions/gatekeeper-image/README.md) for more information.

#### Usage

The following does the same thing as the example in the Docker image section:

    uses: LaCapitale/gatekeeper-actions/.github/actions/gatekeeper-image@v0.1.1
    with:
      gatekeeper-client-id: client_id
      gatekeeper-api-key: ${{ secrets.GATEKEEPER_API_KEY }}
      source-registry: GCR
      image-name: gcr.io/project-id/example:latest
