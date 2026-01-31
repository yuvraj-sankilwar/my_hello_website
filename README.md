# my_hello_website

This project demonstrates how to deploy a **production-ready frontend website** on AWS using **S3, CloudFront, Terraform, and GitHub Actions**.

You can check out the detailed blog on Hashnode (`blog.hashnode.com`) where this project is used as a practical example, and I explain step by step how to deploy a frontend application using this setup.

The goal of this setup is to make frontend deployments:

* Secure
* Automated
* Repeatable
* Easy to maintain

Once configured, you only need to push code to the `main` branch, and the entire deployment process runs automatically.


## 🚀 What This Project Does

- Hosts a static frontend (HTML / React / Vite build) on **Amazon S3**
- Serves the website globally using **CloudFront (CDN + HTTPS)**
- Secures the S3 bucket using **Origin Access Control (OAC)**
- Automates infrastructure using **Terraform**
- Automates deployments using **GitHub Actions**
- Stores Terraform state remotely in **S3** (safe for teams and CI/CD)

---

## 🏗 Architecture Overview

```

GitHub (push to main)
↓
GitHub Actions (CI/CD)
↓
Amazon S3 (static files)
↓
CloudFront (HTTPS + CDN)
↓
Users

```

---

## 📁 Project Structure

```

my_hello_website/
├── src/                 # Frontend source code
├── dist/ or build/      # Generated static files
├── infra/               # Terraform infrastructure code
│   ├── main.tf
│   ├── state-storage.tf
│   └── variables.tf
├── .github/
│   └── workflows/
│       └── deploy.yml   # GitHub Actions deployment workflow
├── package.json
└── README.md

````

---

## ✅ Prerequisites

Before using this project, make sure you have:

- An AWS account
- An S3 bucket for Terraform state (example: `my-terraform-states`)
- AWS IAM user with permissions for:
  - S3
  - CloudFront
- GitHub repository
- Node.js (for frontend build)
- Terraform installed locally

---

## ⚙️ Infrastructure Setup (Terraform)

All AWS resources are created using Terraform.

### 1. Go to the infra folder
```bash
cd infra
````

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Apply infrastructure

```bash
terraform apply
```

This will create:

* A private S3 bucket for the website
* A CloudFront distribution
* Origin Access Control (OAC)
* Secure bucket policy
* HTTPS-enabled CloudFront URL

---

## 🔐 Terraform Remote State

Terraform state is stored in **S3**, not locally.

Benefits:

* State is safe even if you lose local data
* Works with CI/CD
* Team-friendly
* Clear visibility of created AWS resources

---

## 🔄 Automatic Deployments (GitHub Actions)

This project uses GitHub Actions to automate deployments.

### Deployment flow:

1. Push code to the `main` branch
2. GitHub Actions builds the frontend
3. Files are uploaded to S3
4. CloudFront cache is invalidated
5. Website is updated globally

---

## 🔑 Required GitHub Secrets

Add the following secrets to your GitHub repository:

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
CLOUDFRONT_DISTRIBUTION_ID
S3_BUCKET
AWS_REGION
```

---

## 🌐 Accessing the Website

After deployment, your website will be available at the CloudFront URL:

```
https://<cloudfront-distribution-id>.cloudfront.net
```

You can later attach a custom domain and SSL certificate if needed.

---

## 🧠 Why This Setup?

This approach avoids common problems like:

* Public S3 buckets
* Manual AWS console configuration
* Permission errors
* Unclear AWS billing
* Slow global delivery

It is suitable for:

* Freelancers
* Developers
* Static websites
* Client projects
* Production deployments

---

## 📝 Notes

* The frontend must generate static files (`dist/` or `build/`)
* This setup is for **static websites only**
* Backend or APIs should be deployed separately

---

## 🤝 Contributing

Feel free to fork this repo, raise issues, or suggest improvements.

---

## 📌 Final Thought

If you’ve built a frontend but struggled to deploy it properly, this project gives you a **clean, automated, and production-ready solution**.

Once set up, deploying a frontend becomes simple and hassle-free.
