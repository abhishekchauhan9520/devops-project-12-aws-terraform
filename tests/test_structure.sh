#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
for f in terraform/versions.tf terraform/provider.tf terraform/variables.tf terraform/main.tf terraform/outputs.tf terraform/terraform.tfvars.example scripts/plan.sh scripts/apply.sh scripts/destroy.sh; do
  test -f "$ROOT/$f"
done
grep -q 'hashicorp/aws' "$ROOT/terraform/versions.tf"
grep -q 'aws_instance' "$ROOT/terraform/main.tf"
grep -q 'aws_security_group' "$ROOT/terraform/main.tf"
grep -q 'encrypted = true' "$ROOT/terraform/main.tf"
grep -q 'http_tokens                 = "required"' "$ROOT/terraform/main.tf"
grep -q 'aws_region' "$ROOT/terraform/variables.tf"
grep -q 'web_public_ip' "$ROOT/terraform/outputs.tf"
echo 'Project 12 structure tests passed.'
