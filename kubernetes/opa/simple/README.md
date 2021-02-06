# Kubernetes

## 1. Basic

```bash
opa eval -i pod.json -d basic.rego "data.kube.deny[message]" --format bindings
```

