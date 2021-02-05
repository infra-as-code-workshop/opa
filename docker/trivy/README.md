## Trivy

```bash
trivy image centos:7
```

```bash
trivy image --exit-code 1 centos:7
```

## Trivy and OPA

1. Ignore medium and low vulnerability 

```bash
trivy image --ignore-policy basic.rego --exit-code 1 centos:7
```

```bash
trivy image --ignore-policy ignore_all.rego --exit-code 1 centos:7
```

2. Integrate with pipeline