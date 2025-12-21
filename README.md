# dancesage-infrastructure

## Project Structure

```
dancesage-infrastructure/
├── .github/
│   └── workflows/
│       └── terraform.yml         # Plan/Apply on PR
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── modules/
│   ├── gke-cluster/
│   │   ├── main.tf               # GKE cluster setup
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── gpu-nodepool/
│   │   ├── main.tf               # GPU nodes
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── networking/
│       ├── main.tf               # VPC, subnets
│       └── variables.tf
├── .gitignore
└── README.md
```
