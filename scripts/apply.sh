#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../terraform"
echo "Review terraform plan before applying."
terraform apply
