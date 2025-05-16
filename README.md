# Azure Log Automation Terraform Lab

This project provisions a secure log monitoring environment in Microsoft Azure using Terraform. Key infrastructure components include a Log Analytics Workspace, NSG rules, subnet associations, public IP allocation, and a Linux VM for centralized diagnostics and data collection.

## ✅ Successfully Implemented
- Log Analytics Workspace
- Public IP address for VM
- Subnet and NSG creation
- NSG rules for SSH access
- Diagnostic settings for analytics and rule collection
- Data source configuration for existing NSG

## 🚀 Business Value
This lab demonstrates automation of Azure security and monitoring infrastructure, ensuring consistent, auditable deployments suitable for production environments. This aligns with enterprise IaC strategies and helps streamline DevSecOps pipelines.

## 📁 Files Included
- `main.tf` – Core infrastructure
- `vm.tf` – Virtual machine and NIC config
- `variables.tf` – Variables
- `outputs.tf` – Key output values
- `project_summary.md` – Business problem and solution context
- `lessonslearned.md` – Observations and next steps
- `teardown.md` – Cleanup guide
- `architecture.png` – Visual overview
- `.gitignore` – Version control exclusions
