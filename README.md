subgraph "Cloud Infrastructure (AWS/GCP/Azure)"
    direction TB
    LB[Load Balancer / Ingress Controller]
    
    subgraph "Kubernetes Cluster"
        FE[Frontend Pods: Next.js]
        BE[Backend Pods: Go API]
    end

    subgraph "Managed Services"
        DB[(PostgreSQL Database)]
        Vault[HashiCorp Vault / Secrets]
    end
end

subgraph "CI/CD Pipeline (GitHub Actions)"
    Code[Code Commit] --> Lint[Linter & Unit Tests]
    Lint --> Scan[Security Scan: Trivy]
    Scan --> Build[Docker Build & Push]
    Build --> Deploy[Helm/K8s Deploy]
end

%% Interactions
Client --> LB
LB --> FE
FE --> BE
BE --> DB
BE --> Vault
Deploy -.-> FE
Deploy -.-> BE
