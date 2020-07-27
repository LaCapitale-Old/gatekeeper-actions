# La Capitale Gatekeeper Helm GitHub action

This action triggers the installation of the configured [Helm](https://helm.sh/) [chart](https://helm.sh/docs/topics/charts/) into a [Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine/) cluster in either the `devl-gke` or `prod-gke` corporate projects.

## Inputs

### `gatekeeper-client-id`

**Required** The Gatekeeper client id.

### `gatekeeper-api-key`

**Required** The Gatekeeper API key to authorize the request.

### `ops-repo`

**Required** The URL, without the protocol, where the ops repository containing the Helm chart can be retrieved.

### `ops-repo-branch`

The ops repository's branch. Default `"master"`.

### `ops-repo-helm-chart-path`

The ops repository's path where the Helm chart is located, based on the repository's root. Default `"/"`.

### `ops-repo-helm-values-path`

The ops repository's path where the Helm values file is located, from the configured Helm chart's path. Default `"values.yaml"`.

### `helm-release-name`

**Required** The Helm release's name.

### `target-cluster`

**Required** The Kubernetes cluster where to deploy the application. Either `"DEV"` or `"PROD"`.

### `target-namespace`

**Required** The Kubernetes namespace where to deploy the application.

## Outputs

None

## Example usage

    uses: LaCapitale/gatekeeper-actions/.github/actions/gatekeeper-helm@v0.1.0
    with:
      gatekeeper-client-id: client_id
      gatekeeper-api-key: ${{ secrets.GATEKEEPER_API_KEY }}
      ops-repo: github.com/LaCapitale/example
      ops-repo-helm-chart-path: /helm/example
      helm-release-name: example-v0
      target-cluster: DEV
      target-namespace: example-v0-stg
