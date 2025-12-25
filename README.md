📊 Project Diagrams

Бұл бөлімде жобаның құрылымы мен жұмыс процесі көрсетілген.

---

### 🏗️ 1. Жүйе Архитектурасы (System Architecture)
Бұл диаграмма пайдаланушы мен сервердің өзара әрекеттесуін көрсетеді:

```mermaid
graph TD
    User((Пайдаланушы)) -- Browse --> FE[Frontend: Next.js]
    FE -- API Request --> BE[Backend: Go/Python]
    BE -- SQL --> DB[(Database: PostgreSQL)]
    BE -- Cache --> RD((Redis))
    
    subgraph Cloud_Infrastructure
        BE
        DB
        RD
    end
