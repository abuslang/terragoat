resource "aws_elasticsearch_domain" "monitoring-framework" {
  domain_name           = "tg-${var.environment}-es"
  elasticsearch_version = "2.3"

  cluster_config {
    instance_type            = "t2.small.elasticsearch"
    instance_count           = 2
    dedicated_master_enabled = false
    dedicated_master_type    = "m4.large.elasticsearch"
    dedicated_master_count   = 1
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 30
  }
  tags = {
    git_commit           = "99d3535da6c2e07a42738f4ceb2f792c42a80084"
    git_file             = "terraform/aws/es.tf"
    git_last_modified_at = "2023-11-17 14:55:50"
    git_last_modified_by = "asquadri1@gmail.com"
    git_modifiers        = "asquadri1/nimrodkor"
    git_org              = "abuslang"
    git_repo             = "terragoat"
    yor_trace            = "95131dec-d7c9-49bb-9aff-eb0e2736603b"
    yor_name             = "monitoring-framework"
  }
}

data aws_iam_policy_document "policy" {
  statement {
    actions = ["es:*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["*"]
  }
}

resource "aws_elasticsearch_domain_policy" "monitoring-framework-policy" {
  domain_name     = aws_elasticsearch_domain.monitoring-framework.domain_name
  access_policies = data.aws_iam_policy_document.policy.json
}
