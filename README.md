flowchart LR
    Dev([👨‍💻 Developer])
    Repo[📦 GitHub Repository]
    CI[⚙️ GitHub Actions]
    Test[🧪 Tests]
    Scan[🔐 Security Scan]
    Image[🐳 Docker Image]
    Deploy[☸️ Kubernetes Deploy]

    Dev --> Repo
    Repo --> CI
    CI --> Test
    Test --> Scan
    Scan --> Image
    Image --> Deploy
