flowchart TB
    %% ===== USERS =====
    User([👤 User])

    %% ===== FRONTEND =====
    Frontend["🌐 Frontend<br/>Next.js"]

    %% ===== BACKEND =====
    API["⚙️ Backend API<br/>Go Service"]

    %% ===== DATA LAYER =====
    DB[(🗄️ PostgreSQL)]
    Cache[(⚡ Redis)]

    %% ===== INFRA =====
    subgraph Cloud["☁️ Cloud Infrastructure"]
        API
        DB
        Cache
    end

    %% ===== FLOW =====
    User -->|HTTP| Frontend
    Frontend -->|REST / JSON| API
    API --> DB
    API --> Cache
