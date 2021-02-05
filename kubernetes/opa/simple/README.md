# Kubernetes

## 1. Basic

```bash
opa eval -i pod.json -d basic.rego "data.kube.deny[message]" --format bindings
```

## Admission webhook

https://www.openpolicyagent.org/docs/latest/kubernetes-introduction/

## CRD (custom resource definition)

https://github.com/open-policy-agent/gatekeeper