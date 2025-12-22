# dancesage-infrastructure

GCP infrastructure for DanceSage - GKE cluster with GPU support for MMPose inference.

## Project Structure

```
dancesage-infrastructure/
├── .github/
│   └── workflows/
│       └── terraform.yml           # Plan/Apply on PR
├── environments/
│   ├── main.tf                     # Root module
│   ├── variables.tf
│   └── terraform.tfvars
├── modules/
│   ├── artifact-registry/
│   │   ├── main.tf                 # Docker image registry
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── gke-cluster/
│   │   ├── main.tf                 # GKE cluster + CPU pool
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── gpu-nodepool/
│   │   ├── main.tf                 # GPU nodes (T4)
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── networking/
│       ├── main.tf                 # VPC, subnets
│       └── variables.tf
├── .gitignore
└── README.md
```

## Usage

```bash
cd environments
terraform init
terraform plan
terraform apply
```

## Pushing Images to Artifact Registry

After applying, authenticate and push images:

```bash
# Authenticate Docker with GCP
gcloud auth configure-docker us-central1-docker.pkg.dev

# Build and push
docker build -t us-central1-docker.pkg.dev/dancesage/dancesage/mmpose:latest .
docker push us-central1-docker.pkg.dev/dancesage/dancesage/mmpose:latest
```

## Connecting to GKE

```bash
gcloud container clusters get-credentials dancesage-cluster --zone us-central1-a --project dancesage
```
