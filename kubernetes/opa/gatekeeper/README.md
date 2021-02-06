# Gatekeeper

Install gatekeeper from helm chart

```bash
helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
helm install gatekeeper gatekeeper/gatekeeper
```

# Usage

1. Apply constraint template

```bash
kubectl apply -f label/constraint_template.yaml
```

2. Apply constraint - to have gatekeeper label as string

```bash
kubectl apply -f label/constraint.yaml
```

3. Deploy sample application without label

```bash
kubectl apply -f label/dobby.yaml
```

4. Check deployment

```bash
kubectl get deploy -o wide

kubectl get rs -o wide
kubectl describe rs
```

5. Patch sample application with label

```bash
kubectl patch deployment dobby --patch "$(cat label/dobby_patch.yaml)"
```

6. Check deployment

```bash
kubectl get rs -o wide
kubectl describe rs dobby
```