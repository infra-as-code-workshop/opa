## OPA

Repo to demonstrate OPA for following use cases

1. Docker image vulnerability scanning
2. Kubernetes policies using [gatekeeper](https://github.com/open-policy-agent/gatekeeper)
3. Terraform

### Demo

### Prerequisite

Ensure open policy agent is installed

Mac OSX users you can install opa via homebrew

```bash
brew install opa
```

For Nix users,

if you have configured [direnv](https://github.com/direnv/direnv) with [lorri](https://github.com/target/lorri), simply
getting into to the directory should get you all the necessary packages loaded

dependencies, otherwise use `nix-shell` to load the dependencies in `shell.nix` file

for other operating system find out how to install opa [here](https://github.com/open-policy-agent/opa#want-to-get-opa)

### Docker

Install the following packages

```bash
brew install aquasecurity/trivy/trivy
```

For usage, checkout the docs [here](docker/trivy/README.md)

### Kubernetes

Install the following packages

```bash
brew install k3d
brew install terraform
```

For usage, checkout the docs [here](kubernetes/README.md)

### Terraform

Install the following packages

```bash
brew install terraform
```

For usage, checkout the docs [here](kubernetes/README.md)
