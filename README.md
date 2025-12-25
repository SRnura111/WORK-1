flowchart LR
    Dev[👨‍💻 Developer]
    GitHub[📦 GitHub Repo]
    CI[🔄 GitHub Actions CI]
    Tests[🧪 Tests & Linter]
    Security[🔐 Security Scan]
    Docker[🐳 Docker Registry]
    K8s[☸️ Kubernetes Cluster]

    Dev --> GitHub
    GitHub --> CI
    CI --> Tests
    Tests --> Security
    Security --> Docker
    Docker --> K8s
