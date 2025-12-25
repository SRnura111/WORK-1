graph TD
    %% Пайдаланушылар бөлімі
    subgraph Users [Пайдаланушылар]
        U[Client Browser/Mobile]
    end

    %% Бұлттық инфрақұрылым
    subgraph Cloud [Cloud Infrastructure - AWS/GCP]
        LB[Load Balancer / Ingress]
        
        subgraph K8S [Kubernetes Cluster]
            FE[Frontend Pods: Next.js]
            BE[Backend Pods: Go API]
        end

        subgraph Data [Data Layer]
            DB[(PostgreSQL Database)]
            Redis[(Redis Cache)]
        end
        
        subgraph Sec [Security]
            Vault[HashiCorp Vault / Secrets]
        end
    end

    %% CI/CD Процесі
    subgraph CICD [CI/CD Pipeline - GitHub Actions]
        Push[Code Push] --> Test[Linter & Unit Tests]
        Test --> Scan[Security Scan: Trivy]
        Scan --> Build[Docker Build & Push]
        Build --> Deploy[K8s Deployment]
    end

    %% Байланыстар
    U --> LB
    LB --> FE
    FE --> BE
    BE --> DB
    BE --> Redis
    BE --> Vault
    
    %% Deployment байланысы
    Deploy -.-> FE
    Deploy -.-> BE
