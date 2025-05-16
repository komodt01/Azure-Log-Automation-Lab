# Lessons Learned

## ✅ Successes
- Data sources for NSG use worked as expected
- Terraform applied Log Analytics Workspace, VM, and diagnostics
- Modular structure supports extensibility

## ⚠️ Challenges
- Terraform import is required for some Azure-managed associations (NSG <-> subnet)
- Pre-existing Public IPs must be imported, not recreated
- `terraform apply` attempts to delete in-use NSGs unless associations are handled properly

## 📝 Takeaways
- Use `data` blocks for existing infra when reusing
- Validate dependencies using `terraform plan` before apply
- Terraform import may need manual steps and cleanup for seamless redeployments
