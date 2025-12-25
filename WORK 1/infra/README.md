graph TD
    %% Пайдаланушылар
    U[Пайдаланушы / Browser] --> LB[Load Balancer]

    %% Инфрақұрылым
    subgraph Cloud [Cloud Infrastructure]
        LB --> FE[Frontend Pod: Next.js]
        FE --> BE[Backend Pod: Go API]
        
        subgraph Data [Data Layer]
            BE --> DB[(PostgreSQL)]
            BE --> Vault[HashiCorp Vault]
        end
    end

    %% CI/CD Процесі
    subgraph CICD [GitHub Actions CI/CD]
        Code[Code Push] --> Test[Lint & Unit Tests]
        Test --> Build[Docker Build & Push]
        Build --> Deploy[K8s Deploy]
    end

    %% Deployment әсері
    Deploy -.-> FE
    Deploy -.-> BE
