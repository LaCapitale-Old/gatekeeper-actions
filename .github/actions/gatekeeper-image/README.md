# La Capitale Gatekeeper image GitHub action

This action triggers the pull of a [Docker](https://www.docker.com/) image through Gatekeeper.

The source image must be located in either a [Google Container Registry](https://cloud.google.com/container-registry/) or [Github Package Registry](https://github.com/features/packages) that the client id has access to.

That image will be pulled and be accessible in the `corp-prod-gkeinfra` corporate project.

## Inputs

### `gatekeeper-client-id`

**Required** The Gatekeeper client id.

### `gatekeeper-api-key`

**Required** The Gatekeeper API key to authorize the request.

### `source-registry`

**Required** The source registry where the image will be retrieved from. Either `"GCR"` or `"GITHUB"`.

### `image-name`

**Required** The image name that should be pulled.

## Outputs

None

## Example usage

    uses: LaCapitale/gatekeeper-actions/.github/actions/gatekeeper-helm@v0.1.0
    with:
      gatekeeper-client-id: client_id
      gatekeeper-api-key: ${{ secrets.GATEKEEPER_API_KEY }}
      source-registry: GCR
      image-name: gcr.io/project-id/example:latest
