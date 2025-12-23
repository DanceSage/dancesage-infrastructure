# dancesage-infrastructure

Hybrid cloud infrastructure for DanceSage - GKE for services + RunPod for GPU inference.

## Architecture

```
┌─────────────────┐
│   iOS App       │
│   (Swift)       │
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────────┐
│            GKE (GCP)                │
│  ┌─────────────────────────────┐    │
│  │      DanceSage API          │    │
│  │      (CPU workloads)        │────┼──────┐
│  └─────────────────────────────┘    │      │
└─────────────────────────────────────┘      │
                                             ▼
                              ┌─────────────────────────────┐
                              │       RunPod (GPU)          │
                              │  ┌───────────────────────┐  │
                              │  │   MMPose Endpoint     │  │
                              │  │   (Serverless GPU)    │  │
                              │  └───────────────────────┘  │
                              └─────────────────────────────┘
```

## Project Structure

```
dancesage-infrastructure/
├── environments/
│   ├── main.tf                     # Root module (GCP + RunPod)
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
├── modules/
│   ├── artifact-registry/          # Docker image registry (GCP)
│   ├── gke-cluster/                # GKE cluster + CPU pool
│   ├── gpu-nodepool/               # GPU nodes (disabled - using RunPod)
│   ├── github-actions-sa/          # Service account for CI/CD
│   ├── networking/                 # VPC, subnets
│   └── runpod-serverless/          # RunPod GPU endpoint
├── .gitignore
└── README.md
```

## Prerequisites

1. GCP account with billing enabled
2. RunPod account (https://runpod.io)
3. Terraform installed

## Setup

### 1. Get RunPod API Key

1. Go to: https://runpod.io/console/user/settings
2. Copy your API key

### 2. Create terraform.tfvars

```bash
cd environments
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
```

### 3. Apply Infrastructure

```bash
cd environments
terraform init
terraform plan
terraform apply
```

## Outputs

After applying, you'll get:

| Output | Description |
|--------|-------------|
| `gke_cluster_name` | GKE cluster name |
| `artifact_registry_url` | URL for pushing Docker images |
| `github_actions_sa_key` | Service account key for CI/CD |
| `runpod_endpoint_url` | URL to call MMPose inference |

## Calling RunPod Endpoint

```bash
curl -X POST "https://api.runpod.ai/v2/YOUR_ENDPOINT_ID/runsync" \
  -H "Authorization: Bearer YOUR_RUNPOD_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"input": {"image": "base64_encoded_image"}}'
```

## Connecting to GKE

```bash
gcloud container clusters get-credentials dancesage-cluster \
  --zone us-central1-a \
  --project dancesage
```

## Cost Estimates

| Resource | Cost |
|----------|------|
| GKE Cluster | ~$70/month (management fee) |
| CPU Node (e2-medium) | ~$15/month |
| RunPod GPU (per request) | ~$0.0004/second |

GPU costs only when processing requests. Idle = $0.
