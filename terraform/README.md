Ensure terraform changes are applied, run all the command from `../kubernetes/cluster` folder else
append `-chdir=../kubernetes/cluster` for the commands

```bash
terraform apply
```

Now lets taint the gatekeeper resource

```bash
terraform taint helm_release.gatekeeper
```

```bash
terraform plan -out plan.out

## Convert the output to json
terraform show -json plan.out > tfplan.json

## 
opa eval --format pretty --data gatekeeper.rego --input tfplan.json "data.terraform.analysis.authz"
```