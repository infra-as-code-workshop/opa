## Kubernetes

### Simple

```bash
opa eval -i opa/simple/pod.json -d opa/simple/basic.rego "data.kube.deny[message]" --format bindings
```

### Gatekeeper

## Admission webhook

https://www.openpolicyagent.org/docs/latest/kubernetes-introduction/

## CRD (custom resource definition)

https://github.com/open-policy-agent/gatekeeper

#### Usage

```bash
terraform -chdir=cluster plan
terraform -chdir=cluster apply
```

1. Apply constraint template

```bash
kubectl apply -f opa/gatekeeper/label/constraint_template.yaml
```

2. Apply constraint - to have gatekeeper label as string

```bash
kubectl apply -f opa/gatekeeper/label/constraint.yaml
```

3. Deploy sample application without label

```bash
kubectl apply -f opa/gatekeeper/label/dobby.yaml
```

4. Check deployment

```bash
kubectl get deploy -o wide

kubectl get rs -o wide
kubectl describe rs
```

5. Patch sample application with label

```bash
kubectl patch deployment dobby --patch "$(cat opa/gatekeeper/label/dobby_patch.yaml)"
```

6. Check deployment