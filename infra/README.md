# Infrastructure Setup - My Hello Website

Terraform configuration for AWS S3 and CloudFront infrastructure.

## Prerequisites

1. **AWS CLI installed**
   ```bash
   aws --version
   ```

2. **Terraform installed**
   ```bash
   terraform version
   ```

3. **AWS Account** with S3 and CloudFront permissions

## Setup

### 1. Configure AWS Credentials

```bash
aws configure
```

Enter your AWS Access Key ID, Secret Access Key, region (ap-south-1), and output format.

Verify credentials:
```bash
aws sts get-caller-identity
```

### 2. Initialize Terraform

```bash
cd infra
terraform init
```

### 3. Review and Apply Infrastructure

```bash
terraform plan
terraform apply
```

Type `yes` when prompted.

This creates:
- S3 bucket for website files
- S3 bucket for Terraform state storage
- CloudFront distribution
- Origin Access Control
- Bucket policies

### 4. Get Outputs

```bash
terraform output
```

Key outputs:
- `cloudfront_url` - Your website URL
- `cloudfront_distribution_id` - For GitHub Actions
- `s3_bucket_name` - Website bucket name

## State Storage

Terraform state is automatically stored in S3:
- Bucket: `my-hello-website-terraform-state`
- Location: `infrastructure/terraform.tfstate`
- Encrypted and versioned

State is shared across team members automatically.

Push your local state to S3:
```bash
terraform init -migrate-state
```

Type `yes` when prompted to migrate state to S3.

## Configuration

Edit `variables.tf` to customize:
- `bucket_name` - Website S3 bucket name (must be globally unique)
- `aws_region` - AWS region (default: ap-south-1)
- `cloudfront_price_class` - CloudFront price class

Or use `terraform.tfvars`:
```hcl
bucket_name = "my-unique-bucket-name"
aws_region  = "ap-south-1"
```

## GitHub Actions Integration

After deployment, add these secrets to GitHub:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION` (ap-south-1)
- `S3_BUCKET` (from `terraform output s3_bucket_name`)
- `CLOUDFRONT_DISTRIBUTION_ID` (from `terraform output cloudfront_distribution_id`)

## Cleanup

```bash
terraform destroy
```

## Troubleshooting

**Bucket name already exists:**
- S3 bucket names are globally unique
- Change `bucket_name` in `variables.tf` or use `-var="bucket_name=your-unique-name"`

**CloudFront takes 10-15 minutes to deploy:**
- This is normal, wait for deployment to complete

**Access denied errors:**
- Verify AWS credentials: `aws sts get-caller-identity`
- Check IAM permissions for S3 and CloudFront
