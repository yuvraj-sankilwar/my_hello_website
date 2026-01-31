variable "bucket_name" {
  type        = string
  default     = "my-hello-website-unique"
}

variable "aws_region" {
  type        = string
  default     = "ap-south-1"
}

variable "cloudfront_price_class" {
  type        = string
  default     = "PriceClass_100"
  validation {
    condition = contains([
      "PriceClass_All",
      "PriceClass_200",
      "PriceClass_100"
    ], var.cloudfront_price_class)
    error_message = "Price class must be one of: PriceClass_All, PriceClass_200, PriceClass_100"
  }
}

variable "enable_versioning" {
  type        = bool
  default     = true
}

variable "tags" {
  type        = map(string)
  default = {
    Project     = "my-hello-website"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}

variable "state_storage_bucket_name" {
  type        = string
  default     = "my-hello-website-terraform-state"
}
