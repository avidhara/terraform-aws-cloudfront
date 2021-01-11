output "access_identity_id" {
  description = "The identifier for the distribution. For example: EDFDVBD632BHDS5."
  value       = aws_cloudfront_origin_access_identity.this.*.id
}

output "cloudfront_access_identity_path" {
  description = "A shortcut to the full path for the origin access identity to use in CloudFront, see below."
  value       = aws_cloudfront_origin_access_identity.this.*.cloudfront_access_identity_path
}

output "access_identity_etag" {
  description = "The current version of the origin access identity's information. For example: E2QWRUHAPOMQZL."
  value       = aws_cloudfront_origin_access_identity.this.*.etag
}

output "iam_arn" {
  description = "A pre-generated ARN for use in S3 bucket policies (see below). Example: arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E2QWRUHAPOMQZL."
  value       = aws_cloudfront_origin_access_identity.this.*.iam_arn
}

output "s3_canonical_user_id" {
  description = "The Amazon S3 canonical user ID for the origin access identity, which you use when giving the origin access identity read permission to an object in Amazon S3."
  value       = aws_cloudfront_origin_access_identity.this.*.s3_canonical_user_id
}

output "id" {
  description = "The identifier for the distribution. For example: EDFDVBD632BHDS5."
  value       = join("", aws_cloudfront_distribution.this.*.id)
}

output "arn" {
  description = "The ARN (Amazon Resource Name) for the distribution. For example: arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5, where 123456789012 is your AWS account ID."
  value       = join("", aws_cloudfront_distribution.this.*.arn)
}

output "caller_reference" {
  description = "Internal value used by CloudFront to allow future updates to the distribution configuration."
  value       = join("", aws_cloudfront_distribution.this.*.caller_reference)
}

output "status" {
  description = "The current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system."
  value       = join("", aws_cloudfront_distribution.this.*.status)
}

output "trusted_signers" {
  description = "List of nested attributes for active trusted signers, if the distribution is set up to serve private content with signed URLs"
  value       = aws_cloudfront_distribution.this.*.trusted_signers
}

output "domain_name" {
  description = "The domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net."
  value       = join("", aws_cloudfront_distribution.this.*.domain_name)
}

output "last_modified_time" {
  description = "The date and time the distribution was last modified."
  value       = join("", aws_cloudfront_distribution.this.*.last_modified_time)
}

output "in_progress_validation_batches" {
  description = "The number of invalidation batches currently in progress."
  value       = join("", aws_cloudfront_distribution.this.*.in_progress_validation_batches)
}

output "hosted_zone_id" {
  description = "The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to. This attribute is simply an alias for the zone ID Z2FDTNDATAQYW2."
  value       = join("", aws_cloudfront_distribution.this.*.hosted_zone_id)
}
