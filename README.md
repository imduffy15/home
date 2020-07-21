# Home

Configuration for home infrastructure

## Usage

 - Install helm and initialize helm `helm init --client-only`
 - Install helm diff `helm plugin install https://github.com/databus23/helm-diff --version master`
 - Install helm secrets `helm plugin install https://github.com/futuresimple/helm-secretss`
 - Install kustomize
 - Install helmfile
 - Fetch dependencies `helmfile deps`
 - Apply the helm charts with staging or prod configs `helmfile --environment [staging|prod] apply`
