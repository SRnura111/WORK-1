flowchart LR
    %% Client side
    User[👤 Пайдаланушы]
    Browser[🌍 Web Browser]

    %% Frontend
    FE["🖥️ Frontend<br/>Next.js"]

    %% Backend
    API["⚙️ Backend Service<br/>Go / Python"]

    %% Data layer
    DB[(🗄️ PostgreSQL)]
    Cache[(⚡ Redis Cache)]

    %% Cloud block
    subgraph Cloud["☁️ Cloud Infrastructure"]
        API
        DB
        Cache
    end

    %% Connections
    User --> Browser
    Browser --> FE
    FE -->|HTTPS / REST| API
    API -->|Read / Write| DB
    API -->|Fast access| Cache
