flowchart LR
    User[👤 User]
    Frontend[🌐 Frontend<br/>Next.js]
    Backend[⚙️ Backend API<br/>Go]
    Database[(🗄️ Database<br/>PostgreSQL)]
    Cache[(⚡ Redis Cache)]

    User --> Frontend
    Frontend --> Backend
    Backend --> Database
    Backend --> Cache
