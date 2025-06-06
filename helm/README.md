# Helm
A package manager for kubernetes. It packages and pushes a deployment/ configuration to help repo from where you can just download and use it.

You can also make use of reusable modules or snippets and push the the helm repo from where the packages can be used in downstream repos.

A Library Chart is a special type of Helm chart designed specifically to share reusable template definitions, functions, and common configurations.

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami
helm repo update
helm install bitnami/mysql --generate-name
helm list
helm uninstall mysql-1612624192
```


```bash
helm create chaat
helm install --dry-run --debug my-release chaat
helm package .

# Push the chart to helm repo
helm add repo chaat https://charts.com

```

```yaml
# Declare it as dependency in Chart.yaml
# This will pull the dep and wire the definitions wherever required.
dependencies:
  - name: chaat
    version: 0.6.0
    repository: "oci://charts.com/charts/chaat"
```
